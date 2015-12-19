require 'httparty'

module FighterBase
    class Order
        attr_accessor :type, :price, :quantity, :total_filled, :open, :symbol, :fills
    end
end