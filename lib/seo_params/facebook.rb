# -*- encoding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

module SeoParams

  class Facebook

    def initialize(url)
      @url = url
    end

    def all
    api_url = "https://graph.facebook.com/fql?q=select%20click_count,%20comment_count,%20like_count,%20share_count,%20total_count%20from%20link_stat%20where%20url=%22#{@url}%22"
#    response = ActiveSupport::JSON.decode(open(api_url))
    response = JSON.parse(open(api_url).read)
    h = Hash.new
    h["click_count"] = response["data"][0]["click_count"]
    h["comment_count"] = response["data"][0]["comment_count"]
    h["like_count"] = response["data"][0]["like_count"]
    h["share_count"] = response["data"][0]["share_count"]
    h["total_count"] = response["data"][0]["total_count"]
    h
  end

    def likes
      api_url = "https://graph.facebook.com/fql?q=select%20click_count,%20comment_count,%20like_count,%20share_count,%20total_count%20from%20link_stat%20where%20url=%22#{@url}%22"
      response =JSON.parse(open(api_url).read)
      response["data"][0]["like_count"]
    end

  end

end
