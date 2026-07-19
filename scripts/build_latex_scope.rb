#!/usr/bin/env ruby
# Build one LaTeX subsection, section, or part with the live math.tex preamble.

require "fileutils"
require "pathname"

REPOSITORY_ROOT = File.expand_path("..", __dir__)

def abort_usage
  abort "Usage: ruby scripts/build_latex_scope.rb <parts/.../*.tex> <build-directory>"
end

target_argument, build_argument = ARGV
abort_usage unless target_argument && build_argument && ARGV.length == 2

target = File.expand_path(target_argument, REPOSITORY_ROOT)
parts_root = File.join(REPOSITORY_ROOT, "parts") + File::SEPARATOR
abort "Scope target must be an existing .tex file under parts/." unless target.start_with?(parts_root) && File.file?(target) && File.extname(target) == ".tex"

build_directory = File.expand_path(build_argument, REPOSITORY_ROOT)
FileUtils.mkdir_p(build_directory)

relative_target = Pathname.new(target).relative_path_from(Pathname.new(REPOSITORY_ROOT)).to_s
target_source = File.read(target)
heading_match = target_source.match(/^\s*\\(part|section|subsection)\*?\s*\{/)
abort "Scope target must own a part, section, or subsection heading." unless heading_match

path_components = relative_target.split(File::SEPARATOR)
number_prefix = ->(component) { component&.match(/\A(\d+)/)&.[](1)&.to_i }
part_number = number_prefix.call(path_components[1]) || 0
section_number = number_prefix.call(path_components[2]) || 0
file_number = number_prefix.call(File.basename(relative_target)) || 0

counter_setup = case heading_match[1]
                when "part"
                  ["\\setcounter{part}{#{[part_number - 1, 0].max}}"]
                when "section"
                  ["\\setcounter{part}{#{part_number}}", "\\setcounter{section}{#{[section_number - 1, 0].max}}"]
                when "subsection"
                  ["\\setcounter{part}{#{part_number}}", "\\setcounter{section}{#{section_number}}", "\\setcounter{subsection}{#{[file_number - 1, 0].max}}"]
                end

main_source = File.read(File.join(REPOSITORY_ROOT, "math.tex"))
document_marker = "\\begin{document}"
marker_index = main_source.index(document_marker)
abort "math.tex has no \\begin{document} marker." unless marker_index

preamble = main_source[0...marker_index]
input_target = relative_target.sub(/\.tex\z/, "")
driver = <<~TEX
  #{preamble}#{document_marker}
  \\pagenumbering{arabic}
  #{counter_setup.join("\n")}
  \\input{#{input_target}}
  \\end{document}
TEX

driver_path = File.join(build_directory, "scope_inspection.tex")
File.write(driver_path, driver)

command = [
  "latexmk", "-pdf", "-interaction=nonstopmode", "-halt-on-error", "-file-line-error",
  "-outdir=#{build_directory}", driver_path
]

puts "Scope target: #{relative_target}"
puts "Scope driver: #{driver_path}"
success = system(*command, chdir: REPOSITORY_ROOT)
abort "Changed-scope LaTeX build failed." unless success
puts "Scope PDF: #{File.join(build_directory, "scope_inspection.pdf")}"
