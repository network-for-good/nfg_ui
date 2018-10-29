# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Progress Bar Component
      # https://getbootstrap.com/docs/4.1/components/progress/
      class ProgressBar < Bootstrap::Components::Progress
        include Bootstrap::Utilities::Progressable
        include Bootstrap::Utilities::Themeable
        
        def component_family
          :progress
        end

        def style
          [
            options[:style],
            ("width: #{progress.to_i}%;" if progress)
          ].join(' ').squish
        end

        private

        def css_classes
          [
            super,
            ("#{component_css_class}-striped" if striped),
            ("#{component_css_class}-animated" if animated)
          ].join(' ').squish
        end

        def assistive_html_attributes
          super.merge!(role: 'progressbar', aria: { valuenow: progress, valuemin: 0, valuemax: 100 })
        end

        def theme_css_class_prefix
          'bg-'
        end
      end
    end
  end
end
