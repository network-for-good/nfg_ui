module NfgUi
  module ApplicationHelper
    include NfgUi::Utilities::PartialPath
    include NfgUi::Utilities::ComponentGroupings
    include NfgUi::Foundations::FoundationComponents
    include NfgUi::Elements::ElementComponents
    include NfgUi::Patterns::PatternComponents
    # include NfgUi::Utilities::PartialPath

    # include ActiveSupport::Inflector
    def nfg_ui(component_name, trait = nil, **options, &block)
      # options = options.dup
      options[:body] = capture(&block) if block_given?
      component = NfgUi::Components.new(class_name: component_name.to_s.camelize, options: options).call
      # raise component.dismissible?.inspect
      # raise NfgUi::Bootstrap::Components::Alert.new(options).dismissible?.inspect
      # raise component.inspect
      # component = NfgUi::Elements::Alert.new(options)


      # bootcomp: #<NfgUi::Bootstrap::Components::Alert:0x00007fc7d8d7a828 @options={:theme=>:danger, :class=>"my-4", :headline=>"Oh snap! there's a major problem here", :body=>"Yielded from captured block: You forgot to fill out an important field, notice my nifty\n<a href=\"javascript:;\">link without class or classes</a>\nand\n<a class=\"h6 small\" href=\"javascript:;\">link with classes but not alert-link</a>\n<a class=\"test-class alert-link\" href=\"javascript:;\">link with classes and alert-link</a>\n<a class=\"alert-link\" href=\"javascript:;\">link with only alert-link class</a>\n", :dismissible=>true}, @theme=:danger, @body="Yielded from captured block: You forgot to fill out an important field, notice my nifty\n<a href=\"javascript:;\">link without class or classes</a>\nand\n<a class=\"h6 small\" href=\"javascript:;\">link with classes but not alert-link</a>\n<a class=\"test-class alert-link\" href=\"javascript:;\">link with classes and alert-link</a>\n<a class=\"alert-link\" href=\"javascript:;\">link with only alert-link class</a>\n", @headline="Oh snap! there's a major problem here", @dismissible=true>
      # nfg_comp: #<NfgUi::Components:0x00007fb4864651a8 @class_name="Alert", @options={:headline=>"Oh snap! there's a major problem here", :theme=>:danger, :class=>"my-4", :body=>"Yielded from captured block: You forgot to fill out an important field, notice my nifty\n<a href=\"javascript:;\">link without class or classes</a>\nand\n<a class=\"h6 small\" href=\"javascript:;\">link with classes but not alert-link</a>\n<a class=\"test-class alert-link\" href=\"javascript:;\">link with classes and alert-link</a>\n<a class=\"alert-link\" href=\"javascript:;\">link with only alert-link class</a>\n"}>
      
      render_component(component, trait: trait, component_name: component_name)
    end

    private

    def render_component(component, trait: nil, component_name:)
      # partial_path_here
      # raise component.inspect
      # raise component.partial_path(component_name: component_name, trait: trait).inspect
      render partial: partial_path(component_name: component_name, trait: trait), locals: { component_name => component }
    end

    # def partial_path_here
    #   # raise NfgUi::Components.new.foundation_components.inspect
    # end

    # def path(component_name, trait: nil)
    #   [
    #     'nfg_ui',
    #     component_name.pluralize,
    #     (trait.present? ? trait : component_name)
    #   ].join('/').chomp
    # end
  end
end
