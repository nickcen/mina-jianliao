# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mina/jianliao/version'

Gem::Specification.new do |spec|
  spec.name          = "mina-jianliao"
  spec.version       = Mina::Jianliao::VERSION
  spec.authors       = ["nickcen"]
  spec.email         = ["cenyongh@gmail.com"]
  spec.description   = %q{Jianliao web hook from mina}
  spec.summary       = %q{Jianliao web hook from mina}
  spec.homepage      = "https://github.com/nickcen/mina-jianliao"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", '~> 0'

  spec.add_dependency "mina", '~> 0'
  spec.add_dependency "mina-hooks", '~> 0'
end
