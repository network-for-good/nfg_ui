# frozen_string_literal: true

module NfgUi
  module Components
    module Elements
      # Ino coming soon.
      class DropdownItem < Bootstrap::Components::DropdownItem
        include Bootstrap::Utilities::Themeable

        include NfgUi::Components::Utilities::Confirmable
        include NfgUi::Components::Utilities::Describable
        include NfgUi::Components::Utilities::DisableWithable
        include NfgUi::Components::Utilities::Iconable
        include NfgUi::Components::Utilities::Methodable
        include NfgUi::Components::Utilities::Renderable
        include NfgUi::Components::Utilities::Traitable
        
        include NfgUi::Components::Traits::Remote
        include NfgUi::Components::Traits::Active
        include NfgUi::Components::Traits::DisableWith
        include NfgUi::Components::Traits::Disable
        include NfgUi::Components::Traits::Theme

        private

        def default_theme
          nil
        end

        def theme_css_class_prefix
          'text-'
        end

        def outlineable?
          false
        end

        # Other classes inherit DropdownItem (ex: SlatAction)
        def component_css_class
          'dropdown-item'
        end
      end
    end
  end
end
