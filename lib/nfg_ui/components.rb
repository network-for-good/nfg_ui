module NfgUi
  # The parent component module for design system components (excluding bootstrap framework)
  module Components
    include NfgUi::Utilities::Groupings
    include NfgUi::Utilities::PartialPath
    extend ActiveSupport::Autoload

    autoload :Foundations
    autoload :Elements
    autoload :Patterns

    def get_component(class_name:, options:)
      return if nested_class_name_string(class_name: class_name).empty?
      "NfgUi::Components::#{nested_class_name_string(class_name: class_name)}::#{class_name}".constantize.new(options)
    end

    def render_component(component, trait: nil, component_name:)
      render partial: partial_path(component_name: component_name, trait: trait),
             locals: { component_name => component }
    end

    private

    def nested_class_name_string(class_name:)
      str = ''
      NfgUi::GROUPING_NAMES.each do |grouping|
        next unless grouped_components_array(grouping: grouping).include?(class_name.downcase.underscore.to_sym)
        str = grouping.to_s.camelize
      end
      str
    end
  end
end
