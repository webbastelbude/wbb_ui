# lib/wbb_ui/engine.rb
module WbbUi
  class Engine < ::Rails::Engine
    isolate_namespace WbbUi

    initializer "wbb_ui.assets.precompile" do |app|
      app.config.assets.precompile += %w( wbb_ui_manifest.js )
    end
  end
end