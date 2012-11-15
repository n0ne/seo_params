require 'nokogiri'
require 'open-uri'

module SeoParams

  class Yandex

    def initialize(url)
      @url = url
    end


    def tic
      query = Nokogiri::XML(open("http://bar-navig.yandex.ru/u?ver=2&show=32&url=#{@url}"))
      tic = query.xpath('//@value')
      tic.to_s.to_i
    end

  end

end
