module Squib
  class Deck

    def save_pdf(file: 'deck.pdf', dir: '_output')
      #paper is 8.5x11
      # PDF points are 1/72 of an inch
      width = 8.5 * @dpi
      height = 11 * @dpi
      cc = Cairo::Context.new(Cairo::PDFSurface.new("#{dir}/#{file}", width, height))
      margin = 50 #paper margin in px
      x = margin
      y = margin
      @cards.each_with_index do |card, i|
        cc.move_to(x,y)
        cc.set_source(card.cairo_surface, x,y)
        x = (card.width * i)
        if x > (width - margin)
          x = margin 
          y += card.height
        end
        cc.paint
      end
    end

  end
end