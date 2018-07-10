# frozen_string_literal: true

module NfgUi
  module Bootstrap
    # Manifest for Bootstrap utility modules
    module Utilities
      extend ActiveSupport::Autoload

      autoload :Themeable
      autoload :Dismissible
      autoload :Activatable
      autoload :Collapsible
      autoload :Sizable
      autoload :Wrappable
      autoload :Disableable
      autoload :AriaAssistable
    end
  end
end
