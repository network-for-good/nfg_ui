require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
#require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
# require "action_mailer/railtie"
require "action_view/railtie"
# require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
require 'nfg_ui'

module TestApp
  class Application < Rails::Application
    # Load the newest framework defaults the running Rails supports: the suite runs on
    # both 7.2 (gemfiles/rails_7_2.gemfile) and 8.1 (root Gemfile), and 7.2 does not
    # know the 8.1 defaults. Testing under the newest defaults catches problems early
    # for consumers that adopt them.
    config.load_defaults [Rails.gem_version.segments.first(2).join('.').to_f, 8.1].min

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

  end
end
