# frozen_string_literal: true
module NfgUi
  module Utilities
    module PartialPath
      def partial_path(component_name:, trait: nil)
        [
          engine_folder_name,
          grouping_folder(component_name),
          component_name_folder(component_name),
          template_name(component_name, trait: trait)
        ].join('/').chomp
      end

      private

      def engine_folder_name
        'nfg_ui'
      end

      def grouping_folder(component_name)
        str = ''
        [:foundations, :elements, :patterns].each do |grouping|
          next unless grouped_components_array(grouping: grouping).include?(component_name)
          str = grouping.to_s
        end
        str
      end

      def component_name_folder(component_name)
        component_name.to_s.pluralize
      end

      def template_name(component_name, trait: nil)
        trait.present? ? trait : component_name
      end
    end
  end
end
