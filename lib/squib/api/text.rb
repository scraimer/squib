module Squib
  class Deck
    module API

      def font(type: 'Arial', size: 12, **options)
      end

      def set_font(type: 'Arial', size: 12, **options)
      end

      def text(range: :all, str: , font: :use_set, x: 0, y: 0, **options)
        range = 0..(num_cards) if range == :all
        str = [str] * deck.num_cards unless str.respond_to? :each
        range.each do |i|
          cards[i].text(str[i], font, x, y, options)
        end
      end

    end
  end
end