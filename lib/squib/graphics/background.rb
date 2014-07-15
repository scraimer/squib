module Squib
  class Card
    module Graphics

      def background(color)
        cc = cairo_context
        cc.set_source_rgb(*@color)
        cc.paint
      end
      
    end
  end
end