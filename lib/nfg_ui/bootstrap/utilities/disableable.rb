# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Utilities
      # Allows components to have a disabled state when appropriate
      module Disableable
        # attr_accessor :disabled

        # def initialize(*)
        #   super
        #   self.disabled = options.fetch(:disabled, default_disabled)
        #   add_negative_tab_index?
        # end

        def disabled
          options.fetch(:disabled, false)
        end

        # def disabled?
        #   disabled
        # end

        private

        def css_classes
          disabled ? super + ' disabled' : super
        end

        def non_html_attribute_options
          as == :button ? super : super.push(:disabled)
        #   if elements_permitted_to_have_disabled_attribute.include?(as)
        #     super
        #   else
        #     super.push(:disabled)
        #   end
        end

        # def elements_permitted_to_have_disabled_attribute
        #   %i[button
        #      input]
        # end

        # def elements_permitted_to_have_negative_tab_index
        #   %i[a]
        # end

        def assistive_html_attributes
          disabled ? super.merge!(tabindex: '-1') : super
        end

        # def default_disabled
        #   false
        # end
      end
    end
  end
end
