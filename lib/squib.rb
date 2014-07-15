require 'squib/deck'

def deck(width: 825, height: 1125, cards: 1, &block)
  d = Squib::Deck.new(width, height, cards)
  d.instance_eval(&block)
  return d
end