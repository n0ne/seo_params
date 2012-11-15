# -*- encoding: utf-8 -*-

require File.expand_path('../seo_params/google', __FILE__)
require File.expand_path('../seo_params/yandex', __FILE__)

module SeoParams

  class << self

#    def initialize(url)
#      @url = url
#    end

    def all(url)
      h = Hash.new
      h["pr"] = pr(url)
      h["gp"] = gp(url)
      h["tic"] = tic(url)
      h["yap"] = yap(url)
      h
    end

    def pr(url)
      Google.new(url).pagerank
    end

    def tic(url)
      Yandex.new(url).tic
    end

    def yap(url)
      Yandex.new(url).yandex_pages
    end

    def gp(url)
      Google.new(url).google_pages
    end

    def yaposition(url)
    end

    def gposition(url, keywords, options = {})
      options[:hl] ||= "ru"
      options[:cr] ||= "countryUA"
      options[:num] ||= 100

      (keywords.is_a? Array) ? keywords : keywords = Array.new.push(keywords)

      Google.new(url).google_position(options[:hl], options[:cr], keywords, options[:num])
    end

#    def sm(url, keywords, options = {})
#      options[:hl] ||= "ru"
#      options[:cr] ||= "countryUA"


##      (pages.is_a? String) ? (url = pages; pages = ask_yandex(url); ) : pages
#      (keywords.is_a? Array) ? (keywords) : keywords = keywords.split

#      "Url: #{url}, lang: #{options[:hl]}, country: #{options[:cr]}, keys: #{keywords}"
#    end

  end

end
