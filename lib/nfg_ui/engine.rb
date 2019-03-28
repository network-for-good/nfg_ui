# frozen_string_literal: true

module NfgUi
  class Engine < ::Rails::Engine
    isolate_namespace NfgUi

    config.autoload_paths << Engine.root.join("lib")

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
    initializer "nfg_ui.assets.precompile" do |app|
      app.config.assets.precompile << "#{Engine.root.join('app', 'assets', 'config')}/nfg_ui_manifest.js"
    end

    initializer 'static_assets.load_static_assets' do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end

    # Merge `nfg_ui/public` folder's assets & files into
    # the host app's `/public` folder.
    #
    # This is needed for situations where a file must be in
    # the root directory of the website
    #
    # ex: favicons & Apple touch icons need to be at http://website.com/favicon.ico, etc.
    # ... `public/favicon.ico` or `public/apple-touch-icon.png`
    #
    # This is supported by also including the `public` folder in the gemspec's files list:
    # s.files = Dir['{app,config,db,lib,public}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
    # initializer "static assets" do |app|
    #   app.middleware.insert_before(::ActionDispatch::Static, ::ActionDispatch::Static, "#{root}/public")
    # end

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
