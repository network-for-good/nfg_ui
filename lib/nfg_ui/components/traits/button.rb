# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Button traits
      # To do: this needs to be re-worked with the new concept for
      # traits.
      module Button
        TRAITS = %i[block
                    close
                    disable_with
                    link
                    outlined
                    remote
                    submit].freeze
        # include NfgUi::Components::Traits
        # include NfgUi::Components::Traits::Theme
        # include NfgUi::Components::Traits::Size

        # private

        # def local_initialize
        #   @css_classes = 'asdf'
        # end

        def link_trait
          options[:theme] = :link
        #   @theme = :link
        end

        

        def block_trait
          options[:block] = true
        end

        def close_trait
          options[:as] = :button
          data[:dismiss] = options.delete(:dismiss)
          options[:theme] = nil
          @css_classes = 'close'
          options[:icon] = 'times'
          assistive_html_attributes.merge!(aria: { label: 'close' })
        end

        def disable_with_trait
          data[:disable_with] = default_disable_with
        end

        def remote_trait
          options[:remote] = true
        end

        # def disable_with_trait
        #   @disable_with_text = view_context.ui.nfg(:icon, 'spinner spin fw', text: 'Saving...')
        # end

        # def dismissible_trait
        #   @dismissible = true
        # end

        # def remote_trait
        #   @remote = true
        #   @data.merge!(remote: true)
        # end

        def submit_trait
          options[:as] = :button
          options[:type] = 'submit'
        #   options.delete(:href)
        #   assistive_html_attributes.merge!(type: :submit)
        #   @default_html_wrapper_element = :button
        end

        def outlined_trait
          options[:outlined] = true
        #   @outlined = true
        end

        # def allowed_traits
        #   super.push(:disable_with,
        #              :active,
        #              :close,
        #              :block,
        #              :remote,
        #              :submit,
        #              :dismissible,
        #              :outlined,
        #              :link)
        # end
      end
    end
  end
end
