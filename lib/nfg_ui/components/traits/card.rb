# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Card traits
      module Card
        require_relative 'theme'
        include NfgUi::Components::Traits::Theme
      end
    end
  end
end
