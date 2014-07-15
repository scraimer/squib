module Squib
  class Deck
    module API

        def save(format: :png)
          Squib::Graphics::SaveImages.new(format).execute if format==:png
          Squib::Graphics::SaveDoc.new(format).execute if format==:pdf
        end
        
      end
    end
  end
end