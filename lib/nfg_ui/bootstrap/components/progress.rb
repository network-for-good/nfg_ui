# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Progress Component
      # https://getbootstrap.com/docs/4.1/components/progress/
      class Progress < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable
        include Bootstrap::Utilities::AriaAssistable

        attr_reader :progress, :height, :label

        def initialize(*)
          super
          @progress = options.fetch(:progress, default_progress)
          @height = options.fetch(:height, nil)
          @label = view_context.number_to_percentage(progress, precision: 0) if traits.include?(:label)
          build_aria(aria_key: :valuemin, aria_value: 0)
          build_aria(aria_key: :valuenow, aria_value: progress)
          build_aria(aria_key: :valuemax, aria_value: 100)
        end

        def html_options
          super.merge(style: "width: #{progress}%")
        end

        def progress_bar_wrapper_html_options
          { class: 'progress', style: ("height: #{height}" if height.present?) }
        end

        private

        def assistive_html_attributes
          super.merge!(role: 'progressbar')
        end

        def component_css_class
          'progress-bar'
        end

        def default_progress
          0
        end

        def theme_css_class_prefix
          'bg'
        end

        def non_html_attribute_options
          super.push(:progress)
        end
      end
    end
  end
end
