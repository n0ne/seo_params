require "page_rankr"

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
      pages = doc.css('div[@id="resultStats"]').to_s[/\d+/] if doc.css('div[@id="subform_ctrl"]')
      pages ? pages : 0
    end

  end

end
