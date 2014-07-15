module Squib
  class Deck
    module API

      def rect(range: :all, x:, y:, width:, height:, x_radius: 0, y_radius: 0)
        deck = Squib::the_deck
        range = 0..(deck.num_cards-1) if range == :all
        range.each do |i|
        Squib::Graphics::Rectangle.new(deck[i], x, y, width, height, x_radius, y_radius).execute
      end
      
    end
  end
end