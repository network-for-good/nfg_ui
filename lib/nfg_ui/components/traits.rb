# frozen_string_literal: true

module NfgUi
  module Components
    # Centralizes and autoloads traits for design system components
    # Trait modules must have the same name as the component they represent.
    # This provides autoloading of traits.
    module Traits
      extend ActiveSupport::Autoload
      autoload :Alert
      autoload :Button
      autoload :Card
      autoload :Icon
      autoload :PageHeader
      autoload :Size
      autoload :Theme
      autoload :Typeface

      def initialize(*)
        super
        adjust_component_with_traits if traits.any?
      end

      private

      def adjust_component_with_traits
        return unless allowed_traits.present?

        traits.each do |trait|
          next if skipped_traits.include?(trait) || options[trait].present?
          send "#{trait}_trait"
        end
      end

      def allowed_traits
        @allowed_traits ||= []
      end

      def skipped_traits
        @skipped_traits ||= []
      end
    end
  end
end
