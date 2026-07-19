#!/usr/bin/env ruby
# frozen_string_literal: true

if ARGV.empty?
  warn "usage: ruby scripts/check_environment_title_breaks.rb <file-or-directory> [...]"
  exit 2
end

repo_root = File.expand_path("..", __dir__)
base_path = File.join(repo_root, "parts", "base.tex")
environment_names = File.read(base_path).scan(/\\newtheorem\{([^}]+)\}/).flatten.to_h { |name| [name, true] }

files = ARGV.flat_map do |path|
  File.directory?(path) ? Dir.glob(File.join(path, "**", "*.tex")) : path
end.uniq

violations = 0

files.each do |path|
  source = File.readlines(path).map { |line| line.sub(/(?<!\\)%.*/, "") }.join

  source.to_enum(:scan, /\\begin\{([^}]+)\}/).each do
    match = Regexp.last_match
    next unless environment_names[match[1]]

    opening = source[match.end(0)..].match(/\A\s*(?:\\label\{[^}]+\}\s*)?\\hlt\{/)
    next unless opening

    title_start = match.end(0) + opening.end(0) - "\\hlt{".length
    opening_brace = title_start + "\\hlt".length
    depth = 0
    closing_brace = nil

    (opening_brace...source.length).each do |index|
      preceding_backslashes = 0
      cursor = index - 1
      while cursor >= 0 && source[cursor] == "\\"
        preceding_backslashes += 1
        cursor -= 1
      end
      next if preceding_backslashes.odd?

      depth += 1 if source[index] == "{"
      next unless source[index] == "}"

      depth -= 1
      if depth.zero?
        closing_brace = index
        break
      end
    end

    valid_break = closing_brace && source[(closing_brace + 1), 2] == "\\\\"
    next if valid_break

    violations += 1
    line_number = source[0...title_start].count("\n") + 1
    warn "#{path}:#{line_number}: titled environment must place \\\\ immediately after \\hlt{Title}"
  end
end

exit(violations.zero? ? 0 : 1)
