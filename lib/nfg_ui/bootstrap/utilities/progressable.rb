# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Shared methods between Progress & ProgressBar.
      module Progressable
        def animated
          options.fetch(:animated, false)
        end

        def label
          options[:label] == true ? "#{progress}%" : options[:label] || body
        end

        def progress
          options[:progress] || 0
        end

        def striped
          options.fetch(:striped, false)
        end

        def theme
          options.fetch(:theme, nil)
        end

        private

        def non_html_attribute_options
          super.push(:animated,
                     :height,
                     :label,
                     :progress,
                     :striped,
                     :theme)
        end
      end
    end
  end
end
