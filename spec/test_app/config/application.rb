require_relative 'boot'

require 'rails'
require "active_storage/engine"

Bundler.require(*Rails.groups)
require 'nfg_ui'

module TestApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

