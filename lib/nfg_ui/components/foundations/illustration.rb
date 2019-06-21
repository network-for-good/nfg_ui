# frozen_string_literal: true

module NfgUi
  module Components
    module Foundations
      # Grid doc coming soon
      class Illustration < NfgUi::Components::Foundations::Image
        include Bootstrap::Utilities::Sizable
        include NfgUi::Components::Traits::Size
        include NfgUi::Components::Traits::Illustration

        def size
          responsive ? nil : super
        end

        def component_css_class
          responsive ? '' : super
        end

        private

        def default_responsive
          false
        end
      end
    end
  end
end
