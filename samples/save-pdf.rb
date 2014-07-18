#!/usr/bin/env ruby
require 'squib'

names = ['Thief', 'Grifter', 'Mastermind']

Squib::Deck.new(width: 825, height: 1125, cards: 16) do
  background color: :white
  rect x: 38, y: 38, width: 750, height: 1050, x_radius: 38, y_radius: 38

  text str: names, x: 220, y: 78, font: 'Arial 54'

  save_pdf file: "sample.pdf", dir: "_output"
end

puts "Done!"