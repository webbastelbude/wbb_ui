require_relative "../../app/helpers/wbb_ui/ui_helper"

module WbbUi
  class Engine < ::Rails::Engine
    isolate_namespace WbbUi
    
    initializer "wbb_ui.importmap", before: "importmap" do |app|
      # NOTE: this will add pins from this engine to the main app
      # https://github.com/rails/importmap-rails#composing-import-maps
      app.config.importmap.paths << root.join("config/importmap.rb")

      # NOTE: something about cache; I did not look into it.
      # https://github.com/rails/importmap-rails#sweeping-the-cache-in-development-and-test
      app.config.importmap.cache_sweepers << root.join("app/assets/javascripts")
    end

    #initializer "wbb_ui.assets" do |app|
    #  app.config.assets.paths << root.join("app/assets/javascripts/wbb_ui")
    #  app.config.assets.precompile += %w( wbb_ui/controllers/*.js )
    #end

    initializer "wbb_ui.assets" do |app|
      app.config.assets.paths << root.join("app/assets/javascripts/wbb_ui/controllers")
    end

    initializer "wbb_ui.load_helpers" do
      ActiveSupport.on_load(:action_controller_base) do
        helper WbbUi::UiHelper
      end
      ActiveSupport.on_load(:action_view_base) do
        include WbbUi::UiHelper
      end
    end
  end
end