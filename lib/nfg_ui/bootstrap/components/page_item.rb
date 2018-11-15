# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Pagination - Page Item Component
      # https://getbootstrap.com/docs/4.1/components/pagination/
      class PageItem < Bootstrap::Components::Base
        # include Bootstrap::Utilities::Disableable
        include Bootstrap::Utilities::Activatable

        def component_family
          :pagination
        end

        def disabled
          options.fetch(:disabled, false)
        end

        def href
          options[:href] || '#' # return # when nil
        end

        # Send href through to the "page link" that's embedded within
        # the page item component
        def html_options
          super.except!(:href)
        end

        def page_link_html_options
          { class: 'page-link',
            **(disabled ? { tabindex: '-1' } : {}),
            href: href }
        end

        private

        def css_classes
          [
            super,
            ('disabled' if disabled)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:disabled)
        end
      end
    end
  end
end
