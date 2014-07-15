require 'squib/graphics/text'
require 'squib/graphics/save_doc'
require 'squib/graphics/save_images'
require 'squib/graphics/rectangle'
require 'squib/graphics/background'
require 'squib/deck'
require 'squib/card'

class Squib
  def self.deck(width: 825, height: 1125, cards: 1. &block)
    d = Squib::Deck.new(width, height, cards)
    d.instance_eval(&block)
  end
end

