# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Button traits
      # To do: this needs to be re-worked with the new concept for
      # traits.
      module Button
        include NfgUi::Components::Traits
        include NfgUi::Components::Traits::Theme
        include NfgUi::Components::Traits::Size

        private
        
        def link_trait
          @theme = :link
        end

        def active_trait
          @active = true
          build_aria(aria_key: :pressed, aria_value: true)
        end

        def block_trait
          @block = true
        end

        def close_trait
          @as = :button
          data[:dismiss] = options.delete(:dismiss)
          @theme = nil
          @css_classes = 'close'
          @icon = 'times'
          build_aria(aria_key: :label, aria_value: 'Close')
        end

        def disable_with_trait
          @disable_with_text = view_context.ui.nfg(:icon, 'spinner spin fw', text: 'Saving...')
        end

        def dismissible_trait
          @dismissible = true
        end

        def remote_trait
          @remote = true
          @data.merge!(remote: true)
        end

        def submit_trait
          @as = :button
          options.delete(:href)
          assistive_html_attributes.merge!(type: :submit)
          @default_html_wrapper_element = :button
        end

        def outlined_trait
          @outlined = true
        end

        def allowed_traits
          [:disable_with,
           :active,
           :close,
           :block,
           :remote,
           :submit,
           :dismissible,
           :outlined,
           :link]
        end
      end
    end
  end
end
