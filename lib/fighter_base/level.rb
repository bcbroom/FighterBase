require 'exchange'

module FighterBase
    class Level
        @attr_reader api_key, exchange

        def initialize(api_key)
            @api_key = api_key
            @exchange = Exchange.new(self)
        end
    end
end