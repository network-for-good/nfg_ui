# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Button doesn't have any customizations unique to the design system yet
      # As such, the NFG UI Button is simply a bootstrap Button behind the scenes.
      # Traits will eventually be connected here.
      class Button < Bootstrap::Components::Button
        include Utilities::Iconable
        # attr_accessor :body

        # def initialize(*)
        #   super
        #   if traits.present?
        #     self.body = button_body
        #   end
        # end

        # private

        # def button_body
        #   network_for_good_button_traits = (button_traits && traits)

        #   if network_for_good_button_traits.present?

        #   end
        # end

        # def traits
          
        # end

        # def button_traits
        #   [:collapse]
        # end
      end
    end
  end
end
