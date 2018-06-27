# frozen_string_literal: true

module NfgUi
  class Components
    require_relative 'bootstrap/components'
    require_relative 'utilities'
    require_relative 'elements/element_components'
    require_relative 'patterns/pattern_components'
    require_relative 'foundations/foundation_components'

    include NfgUi::Utilities
    include NfgUi::Foundations::FoundationComponents
    include NfgUi::Elements::ElementComponents
    include NfgUi::Patterns::PatternComponents

    def initialize(class_name:, options:)
      @class_name = class_name
      @options = options
    end

    def call
      return unless nested_class_name_string.present?
      "NfgUi::#{nested_class_name_string}::#{@class_name}".constantize.new(**@options)
    end

    private

    def nested_class_name_string
      str = ''
      [:foundations, :elements, :patterns].each do |grouping|
        next unless grouped_components_array(grouping: grouping).include?(@class_name.downcase.underscore.to_sym)
        str = grouping.to_s.camelize
      end
      str
    end
  end
end
