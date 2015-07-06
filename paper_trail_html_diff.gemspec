# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paper_trail_html_diff/version'

Gem::Specification.new do |spec|
  spec.name          = "paper_trail_html_diff"
  spec.version       = PaperTrailHtmlDiff::VERSION
  spec.authors       = ["Miguel Montalvo"]
  spec.email         = ["mmontalvogaete@gmail.com"]
  spec.summary       = "HTML helpers for your Paper Trail versions"
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = %w[lib spec]

  spec.add_runtime_dependency 'differ'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "paper_trail"
  spec.add_development_dependency "rails"
end
