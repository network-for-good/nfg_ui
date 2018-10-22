# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Button Group doesn't have any customizations unique to the design system yet
      # As such, the NFG UI button group is simply a bootstrap button group behind the scenes.
      # Traits will eventually be connected here.
      class Collapse < Bootstrap::Components::Collapse
        # include Bootstrap::Utilities::Collapsible

        # def initialize(*)
        #   super
        #   @body = collapsible_wrapper_html
        # end

        # private

        # def component_css_class
        #   nil
        # end

        # def default_collapsed
        #   true
        # end
      end
    end
  end
end
