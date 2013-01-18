# -*- encoding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

module SeoParams

  class Bing

    def initialize(url)
      @url = url
      @response = Nokogiri::HTML(open("http://www.bing.com/search?q=site:#{url}"))
    end

    def bing_pages
      index = @response.css("span.sb_count").first.text.to_s[/[\d,]+/].delete! ","
      index.to_i
    end

  end

end
