require 'caracal'
require 'caracal-rails'

class Spawnn::Railtie < Caracal::Rails::Railtie
  initializer "Include your code in the controller" do
      ActiveSupport.on_load(:action_controller) do
        include Spawnn
      end
    end
end
