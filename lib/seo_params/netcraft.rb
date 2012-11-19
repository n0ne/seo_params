# -*- encoding: utf-8 -*-
require 'nokogiri'
require 'open-uri'

module SeoParams

  class Netcraft

    def initialize(url)
      @url = url
      @response = Nokogiri::HTML(open("http://toolbar.netcraft.com/site_report?url=#{url}"))
    end

    def all

      h = Hash.new
      h["ip"] = get_ip
      h["siterank"] = get_siterank == 'unknown' ? 'n/a' : get_siterank.to_i
      h["country"] = get_country
      h["nameserver"] = get_nameserver
      h["firstseen"] = get_firstseen
      h["dnsadmin"] = get_dnsadmin
      h["domainregistrator"] = get_domainregistrator == 'unknown' ? 'n/a' : get_domainregistrator
      h["reversedns"] = get_reversedns
      h["organisation"] = get_organisation == 'unknown' ? 'n/a' : get_organisation
      h["nsorganisation"] = get_nsorganisation == 'unknown' ? 'n/a' : get_nsorganisation
      h

    end

    private

      def get_ip
        @response.xpath("//table/tr")[2].children()[1].text()
      end

      def get_siterank
        @response.xpath("//table/tr")[2].children()[4].children().text()
      end

      def get_country
        @response.xpath("//table/tr")[3].children()[1].children().children().text().to_s[/\w+/]
      end

      def get_nameserver
        @response.xpath("//table/tr")[3].children()[4].children().text()
      end

      def get_firstseen
        @response.xpath("//table/tr")[4].children()[1].text()
      end

      def get_dnsadmin
        @response.xpath("//table/tr")[4].children()[4].children().text()
      end

      def get_domainregistrator
        @response.xpath("//table/tr")[5].children()[1].text()
      end

      def get_reversedns
        @response.xpath("//table/tr")[5].children()[4].children().text()
      end

      def get_organisation
        @response.xpath("//table/tr")[6].children()[1].text()
      end

      def get_nsorganisation
        @response.xpath("//table/tr")[6].children()[4].children().text()
      end
  end

end
