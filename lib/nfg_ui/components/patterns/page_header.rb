# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # PageHeader doc coming soon
      class PageHeader < NfgUi::Components::Base
        require_relative '../utilities/titleable'
        require_relative '../traits/page_header'

        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Traits::PageHeader

        attr_reader   :subtitle
        attr_writer   :options
        attr_accessor :button_groups

        def initialize(component_options, *)
          super
          @subtitle = options.fetch(:subtitle, '')
          self.options = defaults.merge!(**default_subtitle, **options) if subtitle?
          self.button_groups = body
        end

        def subtitle?
          subtitle.present?
        end

        def title_column_css_classes
          'py-2 col-12' + (body.present? ? ' col-lg-7' : '')
        end

        def show_button_toolbar?
          body.present?
        end

        private

        def non_html_attribute_options
          super.push(:subtitle)
        end

        def default_subtitle
          { subtitle: '' }
        end
      end
    end
  end
end
