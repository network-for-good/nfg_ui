# frozen_string_literal: true

module NfgUi
  module Components
    # Autoloads utilities unique for NFG design system components
    module Utilities
      extend ActiveSupport::Autoload
      autoload :BrowserDetectable
      autoload :Describable
      autoload :Iconable
      autoload :Methodable
      autoload :Titleable
      autoload :Traitable
      autoload :Renderable
      autoload :ResourceThemeable
      autoload :VerticallyAlignable
    end
  end
end
