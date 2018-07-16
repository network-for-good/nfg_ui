# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # PageHeader doc coming soon
      class PageHeader < NfgUi::Components::Base
        include NfgUi::Components::Utilities::Titleable
        include NfgUi::Components::Traits::PageHeader

        attr_reader :resource_theme_icon,
                    :resource_theme_color,
                    :subtitle

        attr_writer :options

        def initialize(component_options, *)
          super
          @subtitle = options.fetch(:subtitle, '')
          self.options = defaults.merge!(**default_subtitle, **options) if subtitle?
        end

        def subtitle?
          subtitle.present?
        end

        def title_column_css_classes
          'py-2 col-12' + (body.present? ? ' col-lg-7' : '')
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
