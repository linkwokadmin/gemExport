require 'active_support/all'
require 'rmagick'

class Spawnn::PNG < Magick::Image
    def initialize(options = {})
        super(options[:cols], options[:rows]) do
            self.background_color = 'red'
        end
    end
end
