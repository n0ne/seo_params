# -*- encoding: utf-8 -*-
require 'net/http'

module SeoParams

  class GooglePlus

    def initialize(url)
      @url = url
    end

    def plus_ones
      uri = URI.parse("https://clients6.google.com/rpc?key=AIzaSyCKSbrvQasunBoV16zDH9R33D88CeLr9gQ")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data('key' => 'AIzaSyCKSbrvQasunBoV16zDH9R33D88CeLr9gQ')
      request.body = '[{"method":"pos.plusones.get","id":"p","params":{"nolog":true,"id":"' + url + '","source":"widget","userId":"@viewer","groupId":"@self"},"jsonrpc":"2.0","key":"p","apiVersion":"v1"}]'
      response = http.request(request)
    end

  end

end
