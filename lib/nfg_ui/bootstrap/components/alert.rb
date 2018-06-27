# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      class Alert
        include Bootstrap::Utilities::Themeable
        include ActionView::Helpers::TextHelper
        include ActionView::Helpers::TagHelper

        attr_reader :headline, :dismissible, :body

        def initialize(options)
          @options = defaults.merge(options)
          @theme = @options[:theme]
          @body = @options[:body]
          @headline = @options[:headline]
          @dismissible = @options[:dismissible]
        end

        def dismissible?
          @options[:dismissible]
        end

        def html_options
          @options.except(*non_html_attribute_options).merge(class: html_classes, **assistive_html_attributes)
        end

        private

        def component_link_css_class
          'alert-link'
        end

        def assistive_html_attributes
          { role: 'alert' }
        end

        def component_html_class
          'alert'
        end

        def defaults
          {
            theme: default_theme,
            class: '',
            headline: '',
            body: '',
            dismissible: true
          }
        end

        def html_classes
          [component_html_class, theme_html_class, @options[:class]].join(' ')
        end

        def non_html_attribute_options
          [:theme, :body, :headline, :dismissible]
        end
      end
    end
  end
end
