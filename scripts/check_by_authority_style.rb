#!/usr/bin/env ruby
# Enforce by-only authority language inside proof environments.

AUTHORITY_REFERENCE = /\b(?:Theorem|Proposition|Lemma|Corollary|Definition|Assumption)\s+\\ref\{[^}]+\}/i
BANNED_FORMS = [
  /\b(?:we|one)\s+(?:apply|invoke|use|employ)\b/i,
  /\b(?:apply|invoke|use|employ)(?:ing|s|ed)?\s+(?:(?:Theorem|Proposition|Lemma|Corollary|Definition|Assumption)\b|\([ivx]+\)|(?:part|claim)\b)/i,
  /(?:(?:Theorem|Proposition|Lemma|Corollary|Definition|Assumption)\s+\\ref\{[^}]+\}|\b(?:part|claim)\s+\([^)]+\)|\$P[^$]*\$)\s+(?:gives?|yields?|shows?|makes?|implies|ensures?|provides?|proves?)\b/i
].freeze

def source_text(line)
  line.sub(/(?<!\\)%.*\z/, "")
end

def proof_line?(line, depth)
  depth.positive? || line.match?(/\\begin\{proof\}/)
end

paths = ARGV
abort "Usage: ruby scripts/check_by_authority_style.rb <target.tex> [...]" if paths.empty?

violations = []
paths.each do |path|
  proof_depth = 0
  File.readlines(path, chomp: true).each_with_index do |raw_line, index|
    line = source_text(raw_line)
    active = proof_line?(line, proof_depth)
    proof_depth += line.scan(/\\begin\{proof\}/).length

    if active
      line.to_enum(:scan, AUTHORITY_REFERENCE).each do
        match = Regexp.last_match
        prefix = line[0...match.begin(0)]
        clause_start = 0
        prefix.to_enum(:scan, /(?:[.!?](?:\s+|\z)|\\\\\s*)/).each { clause_start = Regexp.last_match.end(0) }
        clause = prefix[clause_start..]
        next if clause&.match?(/\bby\b/i)

        violations << [path, index + 1, "named proof authority must appear in a by-clause", raw_line.strip]
      end

      BANNED_FORMS.each do |pattern|
        next unless line.match?(pattern)

        violations << [path, index + 1, "agent/apply/gives-style authority language is forbidden", raw_line.strip]
      end
    end

    proof_depth -= line.scan(/\\end\{proof\}/).length
  end
end

violations.uniq.each do |path, line_number, message, line|
  warn "#{path}:#{line_number}: #{message}"
  warn "  #{line}"
end

if violations.empty?
  puts "By-only authority-style check passed."
  exit 0
end
exit 1
