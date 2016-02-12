
# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'embedrb/version'

Gem::Specification.new do |gem|
  gem.name          = "embedrb"
  gem.version       = EmbedRb::VERSION
  gem.authors       = ["liris"]
  gem.email         = ["liris.pp@gmail.com"]
  gem.description   = %q{a ruby port of Embed.js}
  gem.summary       = %q{a ruby port of Embed.js}
  gem.homepage      = "https://github.com/liris/embedrb"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
