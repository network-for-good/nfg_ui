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

        private

        def component_css_class
          responsive ? '' : 'illustration'
        end

        def default_responsive
          false
        end
      end
    end
  end
end
