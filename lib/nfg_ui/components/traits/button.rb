# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Button traits
      module Button
        include NfgUi::Components::Traits::Theme

        attr_writer :block

        def initialize(*)
          super
          self.block = traits.include?(:block) || block
        end
      end
    end
  end
end
