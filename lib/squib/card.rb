require 'cairo'



module Squib

	class Card
    attr_reader :width, :height
    attr_accessor :cairo_surface, :cairo_context

    def initialize(width, height)
      @width=width, @height=height
      @cairo_surface = Cairo::ImageSurface.new(width,height)
      @cairo_context = Cairo::Context.new(@cairo_surface)
    end

    ########################
    ### BACKEND GRAPHICS ###
    ########################
    Dir[File.dirname(__FILE__) + 'graphics/*.rb'].each do |file| 
      require File.basename(file, File.extname(file))
    end
    
	end

end