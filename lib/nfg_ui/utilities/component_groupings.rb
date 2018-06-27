# frozen_string_literal: true
module NfgUi
  module Utilities
    module ComponentGroupings
      def grouped_components_array(grouping:)
        send("#{grouping.to_s.singularize}_components")
      end
    end
  end
end
