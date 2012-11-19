# -*- encoding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

module SeoParams

  class Twitter
    def initialize(url)
      @url = url
    end

    def tweets
      api_url = "http://urls.api.twitter.com/1/urls/count.json?url=#{@url}"
      response = JSON.parse(open(api_url).read)
      response["count"]
    end
  end

end
