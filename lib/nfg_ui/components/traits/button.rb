# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Button traits
      module Button
        include NfgUi::Components::Traits::Theme
        attr_reader   :type
        attr_writer   :block, :default_html_wrapper_element
        attr_accessor :submit, :as

        def initialize(*)
          super
          @type = options.fetch(:type, nil)
          self.submit = traits.include?(:submit) || type == 'submit'
          self.block = traits.include?(:block) || block
          self.as = :button if submit?
          @default_html_wrapper_element = submit? ? :button : as
          options[:href] = nil if submit?
        end

        def submit?
          submit
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
