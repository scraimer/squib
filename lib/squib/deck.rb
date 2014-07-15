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
    require 'squib/api/text'

    



  end
end