module Squib
  class Card

    # :nodoc:
    # @api private 
    def save_png(i, dir, prefix, rotate)
      @cairo_surface.flush
      if rotate
        surface = rotated_image
      else
        surface = @cairo_surface
      end
      write_png(surface, i, dir, prefix)
    end

    def rotated_image
      rotated_cc = Cairo::Context.new(Cairo::ImageSurface.new(@height, @width) )
      rotated_cc.save
      rotated_cc.set_source(@cairo_surface)
      rotated_cc.move_to(0,0)
      rotated_cc.rotate(1.5 * Math::PI)
      rotated_cc.paint
      rotated_cc.restore
      rotated_cc.target

    end
    # :nodoc:
    # @api private 
    def write_png(surface, i, dir, prefix)
      surface.write_to_png("#{dir}/#{prefix}#{i}.png")
    end

  end
end