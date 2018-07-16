# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module PageHeader
        attr_reader :sticky, :browser

        def initialize(*)
          super
          @browser = Browser.new(view_context.request.env['HTTP_USER_AGENT'])
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
