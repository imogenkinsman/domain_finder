require 'json'
require 'net/http'

# Namespace for domain_finder gem
module DomainFinder

  # The URL of the domain registrar
  URL = 'https://domai.nr/api/json/search'

  class << self

    # Searches for the availability of one or more domains by using a domain registrar API.
    #
    # @param domains [Array<String>] One or more domain names
    # @return [Array<String>] Domain availability results
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

    # Parses JSON response from API call and converts it to an array of human-readable strings.
    #
    # @private
    # @param json_string [String] A json-parsable string
    # @return [Array<String>] An array of human-readable strings
    def parse_results(json_string)
      json = JSON.parse(json_string)
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
