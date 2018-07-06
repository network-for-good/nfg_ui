module NfgUi
  # Top-level user interface components namespace manager
  # Provides the ability to swap between namespaces at will
  # Ex.: ui.nfg ... and ui.bootstrap
  module UI
    extend ActiveSupport::Autoload

    autoload :Base
    autoload :Bootstrap
    # autoload :Initializer, 'nfg_ui/ui/utilities/initializer'
    autoload :NetworkForGood
    autoload :Utilities
  end
end

# module NfgUi
#   class UI
#     # module Initializer
#     #   attr_accessor :component,
#     #                 :options,
#     #                 :traits,
#     #                 :component_name,
#     #                 :class_name

#     #   # Protect the component from outside manipulation
#     #   # after initialization
#     #   private :component=

#     #   # Using an #initializer to provide a namespace division for
#     #   # UI components.
#     #   #
#     #   # Allows for view helper methods like:
#     #   # = ui.bootstrap :alert
#     #   # = ui.nfg :slats
#     #   def initializer(component_name = nil, *traits, **options, &block)
#     #     @component_name = component_name
#     #     @class_name = component_name.to_s.camelize
#     #     @traits = traits
#     #     @options = options.dup
#     #     options[:body] = capture(&block) if block_given?
#     #     options[:traits] = traits.present? ? traits : []

#     #     self.component = ancestry_string.constantize.new(options)
#     #   end
#     # end

#     # include Initializer

#     # # Child classes manage initialization
#     # def initialize; end

#     # def bootstrap(component_name = nil, *traits, **options, &block)
#     #   NfgUi::BootstrapUI.new(component_name, *traits, **options, &block).render_component
#     # end

#     # def bootstrap?
#     #   false
#     # end

#     # def nfg(component_name = nil, *traits, **options, &block)
#     #   NfgUi::NFG.new(component_name, *traits, **options, &block).render_component
#     # end

#     # def nfg?
#     #   false
#     # end

#     # def render_component
#     #   ApplicationController.render partial: partial_path, locals: { component_name => component }
#     # end

#     # private

#     # def ancestry_string
#     #   ''
#     # end

#     # def component_family
#     #   component.send(:component_family).presence
#     # end

#     # def grouping_folder
#     #   ''
#     # end

#     # def group; end

#     # def components_within_group(*)
#     #   []
#     # end

#     # def partial_path
#     #   [
#     #     'nfg_ui',
#     #     grouping_folder,
#     #     component_name_folder,
#     #     component_name
#     #   ].reject(&:nil?).join('/').chomp
#     # end
#   end

  

#   class BootstrapUI < UI
#     def initialize(component_name = nil, *traits, **options, &block)
#       if NfgUi::BOOTSTRAP_COMPONENT_NAMES.include?(component_name)
#         initializer(component_name, *traits, **options, &block)
#       else
#         raise NameError.new(":#{component_name} isn't a registered bootstrap component.\nDid you mean to use `= ui.bootstrap :#{component_name}`? Perhaps you meant `= ui.nfg :#{component_name}`? \n\nCheck your spelling. Registered bootstrap component_names include:\n#{NfgUi::BOOTSTRAP_COMPONENT_NAMES.join("\n")}")
#       end
#     end

#     def bootstrap?
#       true
#     end

#     private

#     def component_name_folder
#       try(:component_family).try(:to_s).try(:pluralize)
#     end

#     def group
#       'bootstrap'
#     end

#     def grouping_folder
#       'bootstrap'
#     end

#     def ancestry_string
#       "NfgUi::Bootstrap::Components::#{class_name}"
#     end

#     def components_within_group(*)
#       NfgUi::BOOTSTRAP_COMPONENT_NAMES
#     end
#   end
# end
