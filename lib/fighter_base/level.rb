module FighterBase
    class Level
        attr_reader :api_key, :exchange

        def initialize(api_key, venue_symbol)
            @api_key = api_key
            @exchange = Exchange.new(venue_symbol, self)
        end

        def heartbeat
            response = HTTParty.get("https://api.stockfighter.io/ob/api/heartbeat")
            ok = response.parsed_response["ok"] rescue false

            raise "World is on fire!" unless ok
            puts "lump lump, lump lump" if ok
        end
    end
end