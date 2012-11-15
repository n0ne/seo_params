require "page_rankr"

require "em-synchrony"
require "em-synchrony/em-http"
require "em-synchrony/fiber_iterator"
require 'nokogiri'
require 'uri'

module SeoParams

  class Google

    def initialize(url)
      @url = url
    end


    def pagerank
      query = PageRankr.ranks(@url, :google)
      query[:google]
    end

    def google_pages
      doc = Nokogiri::HTML(open("https://www.google.com/search?hl=en&tab=ww&safe=active&tbo=d&sclient=psy-ab&q=site:#{@url}&oq=site:#{@url}"))
      pages = doc.css('div[@id="resultStats"]').to_s[/[\d,]+/] if doc.css('div[@id="subform_ctrl"]')
      pages ? pages.tr(',', '').to_i : 0
    end

    def google_position(hl, cr, keywords, num)

      h = Hash.new

      EventMachine.synchrony do

        EM::Synchrony::FiberIterator.new(@keywords, @keywords.size).each do |keyword|

          new_keyword = check_keyword(keyword)

          uri="http://www.google.com/search?hl=#{hl}&q=#{new_keyword}&btnG=Поиск+в+Google&&cr=#{cr}&meta=&num=#{num}"
          resp = EventMachine::HttpRequest.new(uri).get
          h[keyword] = parse_results resp.response
        end
        EventMachine.stop
      end

      h

    end

    private

      def check_keyword(keyword)
        (keyword.include? ' ') ? (keyword.tr(' ', '+')) : keyword
      end

      def parse_results response
        pos = 0
        i = 1
        doc = Nokogiri::HTML(response)

        doc.xpath('//ol/li/h3/a').each do |link|
          url = link['href'][/(https?:\/\/[\S]+)(&sa)/,1]
          if url.to_s[/none.com.ua/]
            pos = i
            break
          else
            i = i + 1
          end
        end
        pos
      end

  end

end
