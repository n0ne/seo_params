# -*- encoding: utf-8 -*-

require File.expand_path('../seo_params/google', __FILE__)
require File.expand_path('../seo_params/yandex', __FILE__)

module SeoParams

  class << self

    def all(url)
      h = Hash.new
      h["pr"] = pr(url)
      h["gp"] = gp(url)
      h["tic"] = tic(url)
      h["yap"] = yap(url)
      h["tweets"] = tweets(url)
      h["likes"] = likes(url)
      h["ar"] = ar(url)
      h["dmoz"] = dmoz(url)
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

    def yaposition(url, user, key, keywords, options = {})
      options[:lr]  ||= 187
      options[:num] ||= 100

      (keywords.is_a? Array) ? keywords : keywords = Array.new.push(keywords)

      Yandex.new(url).yandex_position(user, key, options[:lr], keywords, options[:num])
    end

    def gposition(url, keywords, options = {})
      options[:hl]  ||= "ru"
      options[:cr]  ||= "countryUA"
      options[:num] ||= 100

      (keywords.is_a? Array) ? keywords : keywords = Array.new.push(keywords)

      Google.new(url).google_position(options[:hl], options[:cr], keywords, options[:num])
    end

    def tweets(url)
      Twitter.new(url).tweets
    end

    def likes(url)
      Fasebook.new(url).likes
    end

    def ar(url)
      Alexa.new(url).rank
    end

    def dmoz(url)
      Alexa.new(url).dmoz
    end

  end

end
