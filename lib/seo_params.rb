# -*- encoding: utf-8 -*-

require File.expand_path('../seo_params/google', __FILE__)
require File.expand_path('../seo_params/yandex', __FILE__)

module SeoParams

  class << self

#    def initialize(url)
#      @url = url
#    end

    def all
    end

    def pr(url)
      Google.new(url).pagerank
    end

    def tic(url)
      Yandex.new(url).tic
    end

    def yap(url)
    end

    def gp(url)
      Google.new(url).google_pages
    end

    def yaposition(url)
    end

    def gposition(url)
    end

  end

end
