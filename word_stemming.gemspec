# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'word_stemming/version'

Gem::Specification.new do |spec|
  spec.name          = "word_stemming"
  spec.version       = WordStemming::VERSION
  spec.authors       = ["Mauricio Zaffari"]
  spec.email         = ["mauricio@intricately.com"]

  spec.summary       = %q{Library to extract a dictionary of stems rated 1 to 5 based on most ocurrences from a colleciton of descriptions, and match descriptions accordingly.}
  spec.homepage      = "http://intricately.com"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "http://bitbucket.com"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "fast-stemmer", "~> 1.0"
  spec.add_dependency "activesupport", "~> 4.2"
end
