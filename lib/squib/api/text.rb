module Squib
  class Deck
    module API

      def font(type: , size: 12, **options)
      end

      def set_font(type: 'Arial', size: 12, **options)
        Squib::queue_command Squib::Graphics::SetFont.new(type,size,options)
      end

      def text(range: :all, str: , font: :use_set, x: 0, y: 0, **options)
        deck = Squib::the_deck
        range = 0..(deck.num_cards-1) if range == :all
        str = [str] * deck.num_cards unless str.respond_to? :each
        range.each do |i|
          Squib::Graphics::Text.new(deck[i], str[i], font, x, y, options).execute
        end
      end

    end
  end
end