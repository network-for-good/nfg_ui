# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to have a collapsed state when appropriate
      module Collapsible
        attr_accessor :collapsed

        def initialize(*)
          super
          self.collapsed = options.fetch(:collapsed, nil)
        end

        def collapsible?
          (traits & collapsible_traits).present? || collapsed
        end

        def collapsed?
          collapsed || traits.include?(:collapsed)
        end

        private

        def collapsible_target_css_classes
          ['collapse', expanded_collapse_css_class].reject(&:nil?).join(' ').squish
        end

        def collapsible_target_id
          "collapse_target_#{id}"
        end

        def expanded_collapse_css_class
          'show' unless collapsed?
        end

        def non_html_attribute_options
          super.push(:collapsed)
        end

        def defaults
          super.merge!(collapsed: default_collapsed)
        end

        def default_collapsed
          false
        end

        def collapsible_traits
          %i[collapsible collapsed]
        end
      end
    end
  end
end
