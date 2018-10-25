# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Progress Component
      # https://getbootstrap.com/docs/4.1/components/progress/
      class Progress < Bootstrap::Components::Base
        include Bootstrap::Utilities::Themeable

        def animated
          options.fetch(:animated, false)
        end

        def height
          options.fetch(:height, nil)
        end

        def label
          options[:label] == true ? "#{progress}%" : options[:label] || body
        end

        def progress
          options[:progress] || 0 # default to 0 if nil
        end

        # TODO: DOESN'T QUITE WORK YET
        # Won't merge in new hashes (like data: { describe: 'whatever' }) unless
        # data is present in the default progress wrapper html options
        #
        # Explore generating an array and then turning into a hash instead of this nonsense
        def progress_wrapper_html_options
          return default_progress_wrapper_html_options unless wrapper_html.present?

          default_progress_wrapper_html_options.each_with_object({}) do |(k, v), combined_options|
            combined_options[k] =
              v.is_a?(String) ? [v, wrapper_html[k]].join(' ') : v.merge(wrapper_html[k])
          end
        end

        def striped
          options.fetch(:striped, false)
        end

        def style
          [
            super,
            "width: #{progress}%;"
          ].join(' ').squish
        end

        def wrapper_html
          options[:wrapper_html] || {}
        end

        private

        def assistive_html_attributes
          super.merge!(role: 'progressbar', aria: { valuenow: progress, valuemin: 0, valuemax: 100 })
        end

        def component_css_class
          'progress-bar'
        end

        def css_classes
          [
            super,
            ("#{component_css_class}-striped" if striped),
            ("#{component_css_class}-animated" if animated)
          ].join(' ').squish
        end

        def default_progress_wrapper_html_options
          { class: 'progress',
            **(height ? { style: "height: #{height}px;" } : {})}
        end

        def non_html_attribute_options
          super.push(:wrapper_html, :height, :progress, :label, :striped)
        end

        def theme_css_class_prefix
          'bg-'
        end
      end
    end
  end
end
