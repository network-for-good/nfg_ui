# frozen_string_literal: true

module NfgUi
  class Engine < ::Rails::Engine
    isolate_namespace NfgUi

    config.autoload_paths << Engine.root.join("lib")

    # TODO: Could not get asset paths to precompile the images/nfg_ui
    # folder. For now, brute force all images via Dir.glob...
    initializer "nfg_ui.assets.precompile" do |app|
      images = Dir.glob(Engine.root.join('app', 'assets', 'images', 'nfg_ui', '**', '*'))
      images << Engine.root.join('app', 'assets', 'images', 'nfg_ui', 'site.webmanifest')
      images << Engine.root.join('public', 'favicon.ico')

      app.config.assets.precompile += images
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
