#!/usr/bin/env ruby
# Report physical source newlines that TeX renders only as an ordinary space.

OPAQUE_ENVIRONMENTS = %w[
  displaymath equation equation* align align* gather gather* multline multline*
  matrix smallmatrix pmatrix bmatrix vmatrix Vmatrix array cases
  figure illustrationfigure visualizationfigure schematicfigure financialexhibitfigure
  sourceimagefigure tablevisualfigure tikzpicture tikzcd axis tabular tabularx
  algorithm algorithmic lstlisting verbatim
].freeze

REPOSITORY_ROOT = File.expand_path("..", __dir__)
FORMAL_ENVIRONMENTS = (File.read(File.join(REPOSITORY_ROOT, "parts", "base.tex")).scan(/\\newtheorem\{([^}]+)\}/).flatten + ["proof"]).uniq.freeze

STRUCTURAL_START = /\A\\(?:begin|end)\{|\A\\(?:part|section|subsection|subsubsection)\*?\{|\A\\item(?:\[[^\]]*\])?(?:\s|\z)|\A\\setlength\{|\A\\(?:label|caption|includegraphics)\{|\A\\(?:newpage|clearpage|pagebreak|centering|noindent)\b/
STRUCTURAL_ONLY = /\A(?:\\begin\{[^}]+\}(?:\[[^\]]*\])?(?:\s+\\label\{[^}]+\})?|\\end\{[^}]+\}|\\setlength\{[^}]+\}\{[^}]+\}|\\(?:part|section|subsection|subsubsection)\*?\{.*\}(?:\s*\\label\{[^}]+\})?|\\(?:newpage|clearpage|pagebreak|centering|noindent))\s*\z/
ITEM_ONLY = /\A\\item(?:\[[^\]]*\])?\s*\z/

def source_text(line)
  line.sub(/(?<!\\)%.*\z/, "").rstrip
end

def explicit_break?(line)
  source_text(line).end_with?("\\\\")
end

def structural_start?(line)
  source_text(line).lstrip.match?(STRUCTURAL_START)
end

def structural_only?(line)
  source_text(line).strip.match?(STRUCTURAL_ONLY)
end

def item_only?(line)
  source_text(line).strip.match?(ITEM_ONLY)
end

def blank_or_comment?(line)
  source_text(line).strip.empty?
end

def opaque_lines(lines)
  stack = []
  lines.map do |line|
    names = line.scan(/\\(begin|end)\{([^}]+)\}/)
    opaque_before = stack.any? { |name| OPAQUE_ENVIRONMENTS.include?(name) }
    names.each do |kind, name|
      if kind == "begin"
        stack << name
      else
        index = stack.rindex(name)
        stack.delete_at(index) if index
      end
    end
    opaque_before || names.any? { |_, name| OPAQUE_ENVIRONMENTS.include?(name) }
  end
end

def blank_formal_lines(lines)
  stack = []
  violations = []
  lines.each_with_index do |line, index|
    violations << index + 1 if line.strip.empty? && stack.any? { |name| FORMAL_ENVIRONMENTS.include?(name) }
    source_text(line).scan(/\\(begin|end)\{([^}]+)\}/).each do |kind, name|
      if kind == "begin"
        stack << name
      else
        stack_index = stack.rindex(name)
        stack.delete_at(stack_index) if stack_index
      end
    end
  end
  violations
end

paths = ARGV
abort "Usage: ruby scripts/check_render_aligned_source_lines.rb <target.tex> [...]" if paths.empty?

violations = []
blank_violations = []
paths.each do |path|
  lines = File.readlines(path, chomp: true)
  blank_formal_lines(lines).each { |line_number| blank_violations << [path, line_number] }
  opaque = opaque_lines(lines)
  lines.each_cons(2).with_index(1) do |(current, following), line_number|
    next if opaque[line_number - 1] || opaque[line_number]
    next if blank_or_comment?(current) || blank_or_comment?(following)
    next if explicit_break?(current) || structural_start?(following)
    next if structural_only?(current) && !item_only?(current)

    violations << [path, line_number, current, following]
  end
end

blank_violations.each do |path, line_number|
  warn "#{path}:#{line_number}: blank source line inside a formal statement or proof creates a forbidden paragraph break"
end

if violations.empty? && blank_violations.empty?
  puts "Render-aligned source-line check passed."
  exit 0
end

violations.each do |path, line_number, current, following|
  warn "#{path}:#{line_number}: physical newline renders as a space; join these lines or add a semantically intended break"
  warn "  #{current.strip}"
  warn "  #{following.strip}"
end
exit 1
