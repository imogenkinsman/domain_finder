# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "domain_finder"
  spec.version       = '0.0.3'
  spec.authors       = ["Jade McGough"]
  spec.email         = "jade@thezets.com"
  spec.summary       = %q{Domain availability checker}
  spec.description   = %q{Check website domain availability from the command line}
  spec.homepage      = "https://github.com/zetsubo/domain_finder"
  spec.license       = "MIT"

  spec.files         = Dir.glob("{bin,lib}/**/*")
  spec.executables   = ["domain"]
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "vcr", "~> 2.8"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "webmock", "~> 1.16"
  spec.add_development_dependency "rspec", "~> 2.14"

end
