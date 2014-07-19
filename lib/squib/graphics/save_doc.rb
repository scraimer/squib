module Squib
  class Deck

    def save_pdf(file: 'deck.pdf', dir: '_output', margin: 50, gap: 0, trim: 0)
      width = 11 * @dpi
      height = 8.5 * @dpi
      cc = Cairo::Context.new(Cairo::PDFSurface.new("#{dir}/#{file}", width, height))
      x = margin ; y = margin
      @cards.each_with_index do |card, i|
        cc.move_to(x,y)
        surface = trim(card.cairo_surface, trim, @width, @height)
        cc.set_source(card.cairo_surface, x,y)
        cc.paint
        x += card.width + gap
        if x > (width - card.width - margin)
          x = margin 
          y += card.height + gap
          if y > (height - card.height - margin)
            x = margin ; y = margin
            cc.show_page #next page
          end
        end

      end
    end

    def trim(surface, trim, width, height)
      if trim > 0
        #Cairo::ImageSurface.new()
      end
      surface
    end

  end
end