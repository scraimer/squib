module Squib
  class Deck
    module API

      def background(color)
        Squib::the_deck.each do |card|
          Squib::Graphics::Background.new(card, color).execute
        end
      end
      
    end
  end
end