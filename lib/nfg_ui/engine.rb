# frozen_string_literal: true

module NfgUi
  class Engine < ::Rails::Engine
    isolate_namespace NfgUi

    config.autoload_paths << Engine.root.join("lib")


    initializer "nfg_ui.assets.precompile" do |app|
      config.assets.precompile += %w( nfg_ui/app_icon/apple-touch-icon.png )
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
