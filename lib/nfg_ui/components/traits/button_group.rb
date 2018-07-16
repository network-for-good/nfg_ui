# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed traits
      module ButtonGroup
        attr_reader :page_header_toolbar

        def initialize(*)
          super
          @page_header_toolbar = traits.include?(:page_header_toolbar)
        end

        def toolbar_html_options
          page_header_toolbar ? super.merge(class: 'float-lg-right') : super
        end
      end
    end
  end
end
