# -*- encoding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

module SeoParams

  class Facebook

    def initialize(url)
      @url = url
    end

    def likes
      api_url = "http://www.facebook.com/plugins/like.php?layout=button_count&href=#{@url}"
      response = Nokogiri::HTML(open(api_url))
      total_likes = response.css("span.pluginCountTextDisconnected")
      total_likes.text()
    end

  end

end
