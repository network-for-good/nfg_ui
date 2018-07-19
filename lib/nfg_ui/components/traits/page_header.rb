# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module PageHeader
        require_relative '../utilities/browser_detectable'
        
        include NfgUi::Components::Utilities::BrowserDetectable
        attr_reader :sticky

        def initialize(*)
          super
          @sticky = traits.include?(:sticky) || options.fetch(:sticky, default_sticky)
          @data = data.merge!(sticky_div_data_attributes) if sticky?
        end

        def sticky?
          return unless sticky
          Rails.env.test? ? false : !browser.mobile?
        end

        private

        def default_sticky
          true
        end

        def sticky_div_data_attributes
          { toggle: 'sticky-div' }
        end
      end
    end
  end
end
