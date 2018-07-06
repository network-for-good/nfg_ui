# frozen_string_literal: true

require 'rails/railtie'

module NfgUi
  # Eager loads the NfgUi library
  class Railtie < Rails::Railtie
    config.eager_load_namespaces << NfgUi
  end
end
