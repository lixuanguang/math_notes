#!/usr/bin/env ruby
# Validate canonical theorem claim/proof enumeration and direction matching.

REPOSITORY_ROOT = File.expand_path("..", __dir__)
THEOREM_ENVIRONMENTS = File.read(File.join(REPOSITORY_ROOT, "parts", "base.tex"))
  .scan(/\\newtheorem\{([^}]+)\}/).flatten
  .select { |name| %w[theorem proposition lemma corollary].include?(name) }
  .freeze

def source_without_comments(path)
  File.readlines(path).map { |line| line.sub(/(?<!\\)%.*/, "") }.join
end

def extract_environment(source, name, start_at = 0)
  opening_pattern = /\\begin\{#{Regexp.escape(name)}\}(?:\[([^\]]*)\])?/
  opening = source.match(opening_pattern, start_at)
  return nil unless opening

  depth = 1
  token_pattern = /\\(begin|end)\{#{Regexp.escape(name)}\}/
  tail = source[opening.end(0)..]
  closing_start = nil
  closing_end = nil
  tail.to_enum(:scan, token_pattern).each do
    token = Regexp.last_match
    depth += token[1] == "begin" ? 1 : -1
    next unless depth.zero?

    closing_start = opening.end(0) + token.begin(0)
    closing_end = opening.end(0) + token.end(0)
    break
  end
  return nil unless closing_start

  {
    begin_start: opening.begin(0),
    body_start: opening.end(0),
    body_end: closing_start,
    end_end: closing_end,
    option: opening[1],
    body: source[opening.end(0)...closing_start]
  }
end

def theorem_blocks(source)
  names = THEOREM_ENVIRONMENTS.map { |name| Regexp.escape(name) }.join("|")
  pattern = /\\begin\{(#{names})\}/
  blocks = []
  cursor = 0
  while (opening = source.match(pattern, cursor))
    environment = extract_environment(source, opening[1], opening.begin(0))
    break unless environment

    environment[:name] = opening[1]
    blocks << environment
    cursor = environment[:end_end]
  end
  blocks
end

def parse_items(body)
  token_pattern = /\\begin\{(enumerate|itemize|description)\}|\\end\{(enumerate|itemize|description)\}|\\item(?![A-Za-z])(?:\[([^\]]*)\])?/
  depth = 0
  starts = []
  body.to_enum(:scan, token_pattern).each do
    token = Regexp.last_match
    if token[1]
      depth += 1
    elsif token[2]
      depth -= 1
    elsif depth.zero?
      starts << { start: token.end(0), label: token[3], marker: token.begin(0) }
    end
  end
  starts.each_with_index.map do |item, index|
    finish = index + 1 < starts.length ? starts[index + 1][:marker] : body.length
    { label: item[:label], content: body[item[:start]...finish] }
  end
end

def normalized_option(option)
  option.to_s.gsub(/\s+/, "")
end

def normalized_label(label)
  label.to_s.gsub(/\s+/, "")
end

def roman(number)
  values = [[1000, "m"], [900, "cm"], [500, "d"], [400, "cd"], [100, "c"],
            [90, "xc"], [50, "l"], [40, "xl"], [10, "x"], [9, "ix"],
            [5, "v"], [4, "iv"], [1, "i"]]
  remainder = number
  values.each_with_object("") do |(value, glyph), result|
    while remainder >= value
      result << glyph
      remainder -= value
    end
  end
end

def iff_claim?(content)
  content.match?(/\\iff|\\Longleftrightarrow|\biff\b|\bif and only if\b/i)
end

def direction(content)
  match = content.match(/\A\s+\(\s*\$(\\Rightarrow|\\Leftarrow)\$\s*\)/)
  return nil unless match

  match[1] == "\\Rightarrow" ? :right : :left
end

def implication_destination(content)
  match = content.match(/\A\$(?:\\Rightarrow)\s+\(([ivxlcdm]+)\)\$/)
  match && match[1]
end

paths = ARGV
abort "Usage: ruby scripts/check_claim_proof_enumeration.rb <target.tex> [...]" if paths.empty?

violations = []
paths.each do |path|
  source = source_without_comments(path)
  theorem_blocks(source).each do |block|
    proof = extract_environment(block[:body], "proof")
    next unless proof

    statement = block[:body][0...proof[:begin_start]]
    proof_body = proof[:body]
    statement_list = extract_environment(statement, "enumerate")
    proof_list = extract_environment(proof_body, "enumerate")
    line_number = source[0...block[:begin_start]].count("\n") + 1
    owner = "#{path}:#{line_number}: #{block[:name]}"

    unless statement_list
      next unless iff_claim?(statement)

      unless proof_list
        violations << "#{owner}: simple iff proof must use the canonical two-direction enumerate"
        next
      end
      if normalized_option(proof_list[:option]) != 'label=\\roman*.'
        violations << "#{owner}: simple iff proof enumerate must use [label=\\roman*.]"
      end
      labels = parse_items(proof_list[:body]).map { |item| normalized_label(item[:label]) }
      expected = ["$(\\Rightarrow)$", "$(\\Leftarrow)$"]
      violations << "#{owner}: simple iff proof items must be $(\\Rightarrow)$ then $(\\Leftarrow)$" unless labels == expected
      next
    end

    statement_items = parse_items(statement_list[:body])
    if normalized_option(statement_list[:option]) != 'label=(\\roman*)'
      violations << "#{owner}: condition/claim statement enumerate must use [label=(\\roman*)]"
    end
    if statement_items.length < 2
      violations << "#{owner}: a single direct claim must remain prose rather than a one-item claim list"
    end
    unless proof_list
      violations << "#{owner}: numbered statement claims require a matching proof enumerate"
      next
    end
    if normalized_option(proof_list[:option]) != 'label=(\\roman*)'
      violations << "#{owner}: numbered-claim proof enumerate must use [label=(\\roman*)]"
    end

    proof_items = parse_items(proof_list[:body])
    custom_labels = proof_items.map { |item| item[:label] }.compact
    if custom_labels.empty?
      if statement_items.any? { |item| iff_claim?(item[:content]) }
        violations << "#{owner}: an iff claim requires repeated roman direction items"
      elsif proof_items.length != statement_items.length
        violations << "#{owner}: direct proof item count #{proof_items.length} does not match #{statement_items.length} statement claims"
      end
      next
    end

    if custom_labels.length != proof_items.length
      violations << "#{owner}: do not mix automatic and custom claim labels in one proof list"
      next
    end

    parsed = proof_items.map do |item|
      {
        label: normalized_label(item[:label]),
        direction: direction(item[:content]),
        destination: implication_destination(item[:content])
      }
    end

    if parsed.all? { |item| item[:destination] }
      expected = statement_items.each_index.map do |index|
        { label: "$(#{roman(index + 1)})$", destination: roman(index + 2 <= statement_items.length ? index + 2 : 1) }
      end
      actual = parsed.map { |item| { label: item[:label], destination: item[:destination] } }
      violations << "#{owner}: implication proof must follow the canonical cycle (i)->(ii)->...->(i)" unless actual == expected
      next
    end

    if parsed.any? { |item| item[:destination] }
      violations << "#{owner}: do not mix implication-cycle items with direct/directional claim items"
      next
    end

    expected = []
    statement_items.each_with_index do |item, index|
      label = "$(#{roman(index + 1)})$"
      if iff_claim?(item[:content])
        expected << { label: label, direction: :right }
        expected << { label: label, direction: :left }
      else
        expected << { label: label, direction: nil }
      end
    end
    actual = parsed.map { |item| { label: item[:label], direction: item[:direction] } }
    violations << "#{owner}: proof items do not match statement claims and iff directions in source order" unless actual == expected
  end
end

if violations.empty?
  puts "Claim/proof enumeration check passed."
  exit 0
end

violations.each { |violation| warn violation }
exit 1
