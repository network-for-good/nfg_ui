# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module Alert
        require_relative 'theme'
        include NfgUi::Components::Traits::Theme

        attr_reader :error

        def initialize(*)
          super
          @error = traits.include?(:error)
          adjust_component_with_traits if traits.any?
        end

        private

        # Placeholder solution until more time is available to address traits
        def adjust_component_with_traits
          traits.each do |trait|
            next if skipped_traits.include?(trait)
            send "#{trait}_trait"
          end
        end

        def error_trait
          @theme = :danger
          @heading = 'Oops!'
          @body = 'There was an error! Please review this submission and try again'
        end

        def allowed_traits
          [*bootstrap4_themes, :dismissible, :error]
        end

        def skipped_traits
          [*bootstrap4_themes, :dismissible]
        end
      end
    end
  end
end
