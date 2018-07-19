# frozen_string_literal: true

module NfgUi
  # The top-level bootstrap framework module
  module Bootstrap
    # extend ActiveSupport::Autoload

    require_relative 'bootstrap/components'
    require_relative 'bootstrap/utilities'
  end
end
