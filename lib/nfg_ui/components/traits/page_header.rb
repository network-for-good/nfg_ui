# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module PageHeader
        include NfgUi::Components::Utilities::BrowserDetectable
        attr_reader :sticky

        def initialize(*)
          super
          @sticky = traits.include?(:sticky)
          @data = data.merge!(sticky_div_data_attributes) if sticky?
        end

        def sticky?
          return unless sticky
          Rails.env.test? ? false : !browser.mobile?
        end

        private

        def sticky_div_data_attributes
          { toggle: 'sticky-div' }
        end
      end
    end
  end
end
