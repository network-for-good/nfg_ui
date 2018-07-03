# frozen_string_literal: true

module NfgUi
  # This is the primary tool for utilizing design system
  # components within views
  #
  # All components are rendered via the nfg_ui ... method
  # Example:
  #   an alert would be rendered as:
  #   nfg_ui(:alert,
  #          headline: 'Oh snap! there's a major problem here',
  #          body: 'Passed in as a local: This is a crazy cool alert!',
  #          theme: :dark, class: 'my-4', data: { describe: 'error-alert' })
  #
  #
  # All components accept a block or content passed in as an argument
  # via the method's :options, see example:
  #
  #   = nfg_ui :alert, headline: 'Oh snap! there's a major problem here' theme: :dark, class: 'my-4' do
  #     Yielded alert body content here.
  #
  #
  # Argument usage for nfg_ui: nfg_ui(component_name, traits = nil, **options, &block)
  #
  # component_name: The listed component name as an underscored symbol
  #                 Find component names within:
  #                   NfgUi::Foundations
  #                   NfgUi::Elements
  #                   NfgUi::Patterns
  #
  # Example component_names: :alert, :empty_state, etc
  #
  #
  # (traits are not yet in active use)
  # traits: Optionally generate a pre-formed ui component with
  #        options that are pre-set to follow design system guidelines verbatim.
  #        pre-set component options / attributes can be
  #        overwritten by passing in manual options.
  #
  #        As a point of reference, traits are
  #        inspired by and used similarly to FactoryBot's traits.
  #
  #   Examples:
  #     For an alert:
  #       nfg_ui :alert, :alert_danger, options...
  #
  #     For an empty state:
  #       nfg_ui :empty_state, :no_results, options...
  #
  #     Overriding an option pre-set by a traits:
  #       In this example, all of the pre-set alert_danger traits apply,
  #       while the theme option is manually reset to :warning
  #       nfg_ui :alert, :alert_danger, theme: :warning
  #
  # options: Options are your fully customizable attributes per component.
  #          The method is smart enough to detect html options
  #          and component class options.
  #
  #          This is seen in the previous examples where you can
  #          pass in an html class or a data attribute
  #          as well as custom attributes such as the component's theme
  #          or content.
  module Builder
    include NfgUi::Components

    def nfg_ui(component_name, *traits, **options, &block)
      options = options.dup
      options[:body] = capture(&block) if block_given?
      options[:traits] = traits.present? ? traits : []
      component = get_component(class_name: component_name.to_s.camelize,
                                options: options)

      render_component(component, component_name: component_name)
    end

    private

    def get_component(class_name:, options:)
      return if nested_class_name_string(class_name: class_name).empty?
      "NfgUi::Components::#{nested_class_name_string(class_name: class_name)}::#{class_name}".constantize.new(options)
    end

    def render_component(component, component_name:)
      render partial: partial_path(component_name: component_name,
                                   parent_component: get_parent_component(component)),
             locals: { component_name => component }
    end

    def get_parent_component(component)
      component.send(:parent_component).presence
    end

    def nested_class_name_string(class_name:)
      str = ''
      NfgUi::GROUPING_NAMES.each do |grouping|
        next unless grouped_components_array(grouping: grouping).include?(class_name.underscore.downcase.to_sym)
        str = grouping.to_s.camelize
      end
      str
    end
  end
end
