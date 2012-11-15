# -*- encoding: utf-8 -*-
require File.expand_path('../lib/seo_params/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alexander Podkidyshev aka none"]
  gem.email         = ["alexander.podkidyshev@gmail.com"]
  gem.description   = %q{"Easy way to retrieve main SEO parameters."}
  gem.summary       = %q{"Easy way to retrieve main SEO parameters: Google PageRank, Yandex tIC, backlinks, SE site positions and etc."}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "seo_params"
  gem.require_paths = ["lib"]
  gem.version       = SeoParams::VERSION
end
