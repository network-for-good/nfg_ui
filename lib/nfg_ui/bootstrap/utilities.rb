# frozen_string_literal: true

module NfgUi
  module Bootstrap
    # Manifest for Bootstrap utility modules
    module Utilities
      extend ActiveSupport::Autoload

      autoload :Themeable
      autoload :Dismissible
      autoload :Activatable
      autoload :Sizable
      autoload :Wrappable
    end
  end
end
