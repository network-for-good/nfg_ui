# frozen_string_literal: true

module NfgUi
  class Engine < ::Rails::Engine
    isolate_namespace NfgUi

    config.autoload_paths << Engine.root.join("lib")
    config.autoload_paths << Engine.root.join("vendors", 'assets', 'javascripts')

    # Ensures that the config/nfg_ui_manifest.js file is compiled
    # which, in turn, ensures that all of the non-autoloaded assets
    # are pre-compiled for the host-app's consumption.
    #
    # If you need to add unique assets to be precompiled
    # (new folders -- e.g.: 'font' -- within the assets directory)
    # update / add to the "links" found on the manifest file.
    #
    # Font assets example:
    # on app/assets/config/nfg_ui_manifest.js
    #
    # //= link_tree '../font/nfg_ui'
    #
    # See manifest here: app/assets/config/nfg_ui_manifest.js
    #
    # Learn more about using the sprockets `link`ing mechanisms:
    # https://github.com/rails/sprockets#link
    #
    # Utilize engine initializer method:
    initializer 'nfg_ui.assets.precompile' do |app|
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

      require_dependency Engine.root + 'lib/nfg_ui/ui/base'
      require_dependency Engine.root + 'lib/nfg_ui/ui/bootstrap'
      require_dependency Engine.root + 'lib/nfg_ui/ui/network_for_good'
      require_dependency Engine.root + 'lib/nfg_ui/ui/utilities'

      # load the utilities
      Dir.glob(Engine.root + "lib/nfg_ui/ui/utilities/**/*.rb").each do |c|
        require_dependency(c)
      end

      # load the bootstrap components
      require_dependency Engine.root + 'lib/nfg_ui/bootstrap/components/base'
      Dir.glob(Engine.root + "lib/nfg_ui/bootstrap/**/*.rb").each do |c|
        require_dependency(c)
      end

      require_dependency Engine.root + 'lib/nfg_ui/components/base'
      Dir.glob(Engine.root + "lib/nfg_ui/components/**/*.rb").each do |c|
        require_dependency(c)
      end
    end
  end
end
