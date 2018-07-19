# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Button traits
      # To do: this needs to be re-worked with the new concept for
      # traits.
      module Button
        include NfgUi::Components::Traits::Theme

        attr_reader   :type, :close
        attr_writer   :block, :default_html_wrapper_element, :size
        attr_accessor :submit, :as

        def initialize(*)
          super
          @type = options.fetch(:type, nil)
          self.submit = traits.include?(:submit) || type == 'submit'
          self.block = traits.include?(:block) || block
          self.size = (traits & bootstrap4_size_options).first || size
          @default_html_wrapper_element = submit? ? :button : as
          @close = traits.include?(:close)
          self.as = :button if submit? || close
          options[:href] = nil if submit? || close
        end

        def submit?
          submit
        end

        def html_options
          return super unless close

          super.merge!(aria: { label: 'Clase' },
                       data: { dismiss: 'modal' },
                       class: 'close')
        end

        def icon
          return super unless close
          'times'
        end

        private

        def assistive_html_attributes
          if traits.include?(:submit) && type != 'submit'
            super.merge!(type: 'submit')
          else
            super
          end
        end
      end
    end
  end
end
