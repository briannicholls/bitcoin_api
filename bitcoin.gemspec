require_relative 'lib/bitcoin/version'

Gem::Specification.new do |spec|
  spec.name          = "bitcoin-api"
  spec.version       = Bitcoin::VERSION
  spec.authors       = ["Brian Nicholls"]
  spec.email         = ["nichol88@gmail.com"]

  spec.summary       = %q{bitcoin.com API interface}
  spec.homepage      = "https://github.com/nichol88/bitcoin_api"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
