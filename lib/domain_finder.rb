require 'json'
require 'net/http'

module DomainFinder

  URL = 'https://domai.nr/api/json/search'

  class << self
    def search(domains)

      results = []

      domains.each do |domain|
        uri = URI.parse(URL)
        params = { q: domain }
        uri.query = URI.encode_www_form(params)

        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true

        request = Net::HTTP::Get.new(uri.request_uri)

        res = http.request(request)

        results << "** #{domain} **" if domains.size > 1

        if res.is_a?(Net::HTTPSuccess)
          results += parse_results(res.body)
        elsif res.is_a?(Net::HTTPBadRequest)
          results << "Registrar doesn't like your request. Try a different one."
        else
          raise "Error #{res.code} while accessing domain registrar"
        end

      end

      results
    end

    private

    def parse_results(results)
      json = JSON.parse(results)
      json['results'].map do |result|
        case result['availability']
        when 'available'
          "o  #{result['domain']}"
        when 'maybe'
          "?  #{result['domain']}"
        else
          "x  #{result['domain']}"
        end
      end
    end
  end
end
