module Squib
  class Card
    module Graphics
      
      def draw_rectangle(x, y, width, height, x_radius, y_radius)
        cc = @card.cairo_context
        cc.set_source_rgb(0.0,0.0,0.0)
        cc.rounded_rectangle(@x, @y, @width, @height, @x_radius, @y_radius)
        cc.stroke
      end
      
    end
  end
end