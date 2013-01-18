# -*- encoding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

module SeoParams

  class Yahoo

    def initialize(url)
      @url = url
      @response = Nokogiri::HTML(open("http://search.yahoo.com/search?p=site:#{url}"))
    end

    def yahoo_pages
      index = @response.xpath("//span[@id='resultCount']").first.children.to_s.delete! ","
      index.to_i
    end

  end

end
