module Spawnn
  class Engine < ::Rails::Engine
    initializer 'spawnn.assets.precompile' do |app|
      puts "INITILI------------"
      app.config.assets.precompile += %w(
      spawnn.css
      assets/spawnn.css
    )

    initializer :assets do |config|
      puts "NOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO"
      Rails.application.config.assets.paths << root.join("app", "assets", "stylesheets")
    end
    end
  end
end
