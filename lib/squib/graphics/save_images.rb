module Squib
  class Card
    module Graphics

      def save_png(i)
        cairo_context.target.write_to_png("_img/img_#{i}.png")
      end

    end
  end
end