# frozen_string_literal: true

module NfgUi
  class Engine < ::Rails::Engine
    isolate_namespace NfgUi

    config.autoload_paths << Engine.root.join("lib")

    initializer "nfg_ui.assets.precompile" do |app|
      # In the event that we need to pre-compile assets, this operates
      # as a working example of pre-compiling the assets/images folder
      # for consumption and use by the host app.
      #
      # Example: (from within host app)
      # = image_tag 'nfg_ui/email/logo.png'
      #
      # Noted by JR: 3/27/19
      # Remove this note when appropriate.
      #
      # Code to re-enstate:
      # assets = Dir.glob(Engine.root.join('app', 'assets', 'images', 'nfg_ui', '**', '*'))
      # assets << "#{Engine.root.join('public')}/favicon.ico"
      # app.config.assets.precompile += assets

      app.config.assets.precompile << "#{Engine.root.join('app', 'assets', 'config')}/nfg_ui_manifest.js"
    end



    config.to_prepare do
      ActiveSupport.on_load :action_controller do
        helper NfgUi::ApplicationHelper
        helper NfgUi::Components::ResourceThemesHelper
        helper NfgUi::Components::TooltipHelper
        helper NfgUi::Components::EmailHelpers
      end

      ActiveSupport.on_load :action_mailer do
        helper NfgUi::Components::EmailHelpers
      end
    end
  end
end
