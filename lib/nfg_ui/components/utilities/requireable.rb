# frozen_string_literal: true

module NfgUi
  module Components
    module Utilities
      # Set specific options to be required and provides an
      # error if the required attribute is missing.
      #
      # Define required attributes as an array with a
      # #required method on the parent component
      # Example:
      # Within TileHeader:
      # def required
      #   [:id]
      # end
      module Requireable
        attr_accessor :required

        def initialize(*)
          super
          return unless required.presence
          error if missing_required_options?
        end

        private

        def present_required_options
          (options.keys & required)
        end

        def missing_required_options?
          present_required_options.empty?
        end

        def error
          missing_options = ''

          required.each_with_index do |required_option, i|
            i += 1
            next if options.keys.include?(required_option)
            missing_options += " :#{required_option}"
            missing_options += (',' unless required.size == i)
          end

          raise ArgumentError.new "you must pass in #{missing_options} to #{self.class}"
        end
      end
    end
  end
end
