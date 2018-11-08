# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Manages trait system
      module Traitable
        include NfgUi::Components::Traits

        def utility_initialize
          super
          initialize_traits
        end

        def traits
          options[:traits] || []
        end

        private

        def initialize_traits
          return unless traits.any?

          traits.each do |trait|
            next unless NfgUi::Components::Traits::REGISTERED_TRAITS.include?(trait)
            send("#{trait}_trait")
          end
        end
      end
    end
  end
end
