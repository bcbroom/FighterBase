require "httparty"
require "json"

module FighterBase
    class Exchange
        attr_reader :venue_symbol, :level

        def initialize(venue_symbol, level)
            @base_url = "https://api.stockfighter.io/ob/api"
            @venue_symbol = venue_symbol
            @level = level
        end

        def heartbeat
            response = HTTParty.get("#{@base_url}/venues/#{@venue_symbol}/heartbeat")
            ok = response.parsed_response["ok"] rescue false

            raise "World is on fire!" unless ok
            puts "lump lump, lump lump" if ok
        end

        def get_quote(stock)
            response = HTTParty.get("#{@base_url}/venues/#{@venue_symbol}/stocks/#{stock}/quote")
            return response.parsed_response
        end

        def get_order_book(stock)
            response = HTTParty.get("#{@base_url}/venues/#{venue_symbol}/stocks/#{stock}")
            return response.parsed_response
        end

#        def place_order(order)
#            response = HTTParty.post("#{@base_url}/venues/#{venue_symbol}/stocks/#{stock}/orders",
#                         :body => JSON.dump(order),
#                         :headers => {"X-Starfighter-Authorization" => apikey}
#                         )
#            return response.parsed_response
#        end

        def place_order(stock:, price:, qty:, direction:, type: "limit")
            order_data = {
                "account" => @level.account,
                "venue" => @venue_symbol,
                "symbol" => stock,
                "price" => price,
                "qty" => qty,
                "direction" => direction,
                "orderType" => type
            }

            response = HTTParty.post("#{@base_url}/venues/#{@venue_symbol}/stocks/#{stock}/orders",
                         :body => JSON.dump(order_data),
                         :headers => {"X-Starfighter-Authorization" => @level.api_key}
                         )
            return response.parsed_response

        end

        def cancel_order(stock, order_id)
            response = HTTParty.delete("#{@base_url}/venues/#{venue_symbol}/stocks/#{stock}/orders/#{order_id}",
                :headers => {"X-Starfighter-Authorization" => @level.api_key}
                )
            return response.parsed_response
        end
    end
end