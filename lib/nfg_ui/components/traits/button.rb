# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Button traits
      module Button
        TRAITS = %i[block
                    close
                    link
                    outlined
                    remote
                    submit].freeze

        def link_trait
          options[:theme] = :link
        end

        def block_trait
          options[:block] = true
        end

        def close_trait
          self.as = :button
          data[:dismiss] = options.delete(:dismiss)
          options[:theme] = nil
          @css_classes = 'close'
          @body = '&times;'.html_safe
          assistive_html_attributes.merge!(aria: { label: 'close' })
        end

        def remote_trait
          options[:remote] = true
        end

        def submit_trait
          self.as = :button
          options[:type] = 'submit'
        end

        def outlined_trait
          options[:outlined] = true
        end
      end
    end
  end
end
