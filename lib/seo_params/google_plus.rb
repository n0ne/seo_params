# -*- encoding: utf-8 -*-
require 'nokogiri'
require 'open-uri'
require "cgi"

module SeoParams

  class GooglePlus

    def initialize(url)
      @url = url.match(/^(https?:\/\/)/) ? url : 'http://' + url
    end

    def plus_ones
      api_url = "https://plusone.google.com/_/+1/fastbutton?url=#{CGI.escape(@url)}"
      response = Nokogiri::HTML(open(api_url))
      total_plus_ones = response.css("#aggregateCount")
      convert_count(total_plus_ones.text())
    end

    private

    def convert_count(count_string)
      multiplier = case count_string[/(\D\z)/]
      when 'M'; 1000000
      when 'k'; 1000
      else; 1
      end
      (count_string.to_f * multiplier).to_i
    end

  end

end
