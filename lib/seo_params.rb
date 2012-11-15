# -*- encoding: utf-8 -*-

require File.expand_path('../seo_params/google', __FILE__)
require File.expand_path('../seo_params/yandex', __FILE__)

module SeoParams

  class << self

    def initialize(url)
      @url = url
    end

    def all
    end

    def pr
      Google.new.pagerank(url)
    end

    def tic
    end

    def yap
    end

    def gp
    end

    def yaposition
    end

    def gposition
    end

  end

end
