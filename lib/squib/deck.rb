require 'squib/card'
module Squib

  class Deck
    include Enumerable
    attr_reader :width, :height, :num_cards

    def initialize(width: , height: , cards: , &block)
      @width=width; @height=height; @num_cards=cards
      @cards = []
      num_cards.times{ @cards << Squib::Card.new(width, height) }
      instance_eval(&block)
    end

    def [](key)
      @cards[key]
    end

    #For Enumerable
    def each(&block)
      @cards.each { |card| block.call(card) }
    end

    ##################
    ### PUBLIC API ###
    ##################

    def foo
      puts "Foo on a #{@width}x#{@height} deck"
    end

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

    def image(range=:all, file: , x: 0, y: 0)
    end

    def rect(range: :all, x:, y:, width:, height:, x_radius: 0, y_radius: 0)
      deck = Squib::the_deck
      range = 0..(deck.num_cards-1) if range == :all
      range.each do |i|
        Squib::Graphics::Rectangle.new(deck[i], x, y, width, height, x_radius, y_radius).execute
      end
    end

    def background(color)
      Squib::the_deck.each do |card|
        Squib::Graphics::Background.new(card, color).execute
      end
    end

    def load_csv(file:, header: true)
    end

    def data(field)
    end

    def save(format: :png)
      Squib::Graphics::SaveImages.new(format).execute if format==:png
      Squib::Graphics::SaveDoc.new(format).execute if format==:pdf
    end

  end
end