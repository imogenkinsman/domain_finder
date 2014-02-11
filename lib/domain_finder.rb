require "domain_finder/version"
require 'json'
require 'net/http'

module DomainFinder

  URL = 'https://domai.nr/api/json/search'

  class << self
    def search(domains)

      results = []

      domains.each do |domain|
        uri = URI(URL)
        params = { q: domain }
        uri.query = URI.encode_www_form(params)
        res = Net::HTTP.get_response(uri)

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
          "○  #{result['domain']}"
        when 'maybe'
          "?  #{result['domain']}"
        else
          "✘  #{result['domain']}"
        end
      end
    end
  end
end
