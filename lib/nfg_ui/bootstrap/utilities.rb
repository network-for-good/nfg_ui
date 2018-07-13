# frozen_string_literal: true

module NfgUi
  module Bootstrap
    # Manifest for Bootstrap utility modules
    module Utilities
      extend ActiveSupport::Autoload

      autoload :Activatable
      autoload :AriaAssistable
      autoload :Collapsible
      autoload :Disableable
      autoload :Dismissible
      autoload :Sizable
      autoload :Themeable
      autoload :Tooltipable
      autoload :Wrappable
    end
  end
end
