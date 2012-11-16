# -*- encoding: utf-8 -*-
require File.expand_path('../lib/seo_params/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Alexander Podkidyshev aka none"]
  gem.email         = ["alexander.podkidyshev@gmail.com"]
  gem.description   = %q{"Easy way to retrieve main SEO parameters."}
  gem.summary       = %q{"Easy way to retrieve main SEO parameters: Google PageRank, Yandex tIC, backlinks, SE site positions and etc."}
  gem.homepage      = "https://github.com/n0ne/seo_params"

  gem.add_runtime_dependency "nokogiri",                  ">= 1.5.0"
  gem.add_runtime_dependency "page_rankr",                ">= 3.2.1"
  gem.add_runtime_dependency "em-http-request",           ">= 1.0.3"
  gem.add_runtime_dependency "em-synchrony",              ">= 1.0.2"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "seo_params"
  gem.require_paths = ["lib"]
  gem.version       = SeoParams::VERSION
end
