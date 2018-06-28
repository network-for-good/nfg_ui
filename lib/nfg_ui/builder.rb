module NfgUi
  class Builder
    p ":::::: #{__FILE__.split('/').last.to_s} :::::: #{__FILE__} :::::: Loaded"
    include NfgUi::Utilities::Groupings

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
      NfgUi::GROUPING_NAMES.each do |grouping|
        next unless grouped_components_array(grouping: grouping).include?(@class_name.downcase.underscore.to_sym)
        str = grouping.to_s.camelize
      end
      str
    end
  end
end
