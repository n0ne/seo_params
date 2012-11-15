# -*- encoding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

module SeoParams

  class Yandex

    def initialize(url)
      url.match(/^(http:\/\/)/) ? @url = url : @url = 'http://' + url
    end


    def tic
      query = Nokogiri::XML(open("http://bar-navig.yandex.ru/u?ver=2&show=32&url=#{@url}"))
      tic = query.xpath('//@value')
      tic.to_s.to_i
    end

    def yandex_pages
       pages = ask_yandex(@url)
      (pages.is_a? String) ? (@url = pages; pages = ask_yandex(pages); ) : pages
      pages
    end

    private
      def ask_yandex(url)

        doc = Nokogiri::HTML(open("http://webmaster.yandex.ua/check.xml?hostname=#{url}"))

        if doc.css('div.error-message').length > 0
          if doc.css('div.error-message').to_s.scan('Сайт является зеркалом')
            url_regexp = /\?hostname\=([a-zA-Z\.0-9]{1,})/
            new_url = doc.css('div.error-message').to_s.scan(url_regexp)[0][0]
            index = 'http://' + new_url
          end

        else
          doc.css('div.header div').each do |link|
              pages = /\d{1,}/
              @pages_in_index = link.content.scan(pages)
              index = @pages_in_index[0].to_i
          end
        end

        index
      end

  end

end
