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

  end

end
