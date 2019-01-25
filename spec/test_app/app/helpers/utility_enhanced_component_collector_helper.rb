module UtilityEnhancedComponentCollectorHelper
  # Component suites - :nfg, :bootstrap
  # tested_method example: :profile
  def components_that_have_defined_method(component_suite:, tested_method:, css_class: false)
    components = []

    send("#{component_suite}_component_suite").each do |component_name|
      component = NfgUi::UI::NetworkForGood.new(nil, component_name.to_sym)
      component_class = component.send(:ancestry_string).constantize

      next unless component_class.method_defined?(tested_method)

      components << component_name_or_css_class(component_class: component_class, component_name: component_name, css_class: css_class)
    end

    components
  end

  private

  def nfg_component_suite
    [*NfgUi::FOUNDATION_COMPONENT_NAMES, *NfgUi::ELEMENT_COMPONENT_NAMES, *NfgUi::PATTERN_COMPONENT_NAMES]
  end

  def bootstrap_component_suite
    Nfg::BOOTSTRAP_COMPONENT_NAMES
  end

  def component_name_or_css_class(component_class:, component_name:, css_class:)
    if css_class
      component_class.new({}, ApplicationController.new.view_context).send(:component_css_class)
    else
      component_name
    end
  end
end
