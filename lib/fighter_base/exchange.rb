require "httparty"

module FighterBase

    class Exchange
        attr_reader :venue_symbol, :level

        def initialize(venue_symbol, level)
            @venue_symbol = venue_symbol
            @level = level
        end

        def heartbeat
            response = HTTParty.get("https://api.stockfighter.io/ob/api/venues/#{@venue_symbol}/heartbeat")
            ok = response.parsed_response["ok"] rescue false

            raise "World is on fire!" unless ok
            puts "lump lump, lump lump" if ok
        end
    end
end