# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "Othello Game"
  spec.version       = '1.0'
  spec.authors       = [""]
  spec.email         = [""]
  spec.summary       = %q{Othello AI}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = ['lib/OthelloGame.rb']
  spec.executables   = ['bin/OthelloGame']
  spec.test_files    = ['tests/test_OthelloGame.rb']
  spec.require_paths = ["lib"]
end
