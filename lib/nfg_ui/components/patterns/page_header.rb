# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # PageHeader doc coming soon
      class PageHeader < NfgUi::Components::Base
        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Utilities::BrowserDetectable
        include NfgUi::Components::Utilities::Renderable

        include NfgUi::Components::Traits::PageHeader

        def data
          sticky ? super.merge!(toggle: 'sticky-div') : super
        end

        def sticky
          return if Rails.env.test? || browser.mobile?
          options.fetch(:sticky, true)
        end

        def subtitle
          options.fetch(:subtitle, nil)
        end

        private

        def non_html_attribute_options
          super.push(:subtitle)
        end
      end
    end
  end
end
