require 'squib/card'

module Squib
  class Deck
    include Enumerable
    attr_reader :width, :height
    attr_reader :cards

    def initialize(width, height, cards)
      @width=width; @height=height
      @cards = []
      cards.times{ @cards << Squib::Card.new(width, height) }
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
    Dir[File.dirname(__FILE__) + 'api/*.rb'].each do |file| 
      require File.basename(file, File.extname(file))
    end

  end
end