# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Breadcrumb Item
      # Subcomponent of Breadcrumb
      # https://getbootstrap.com/docs/4.1/components/breadcrumb/
      class BreadcrumbItem < NfgUi::Bootstrap::Components::Base
        include Bootstrap::Utilities::Activatable

        def component_family
          :breadcrumb
        end

        def render
          if href
            # remove href from options hash so it does not
            # get added to the parent element -- and instead
            # gets stored so we can use it to build the
            # inserted <a> tag.
            delegated_href = options.delete(:href)

            super do
              view_context.link_to(body, delegated_href)
            end
          else
            super
          end
        end

        private

        def base_element
          :li
        end

        def assistive_html_attributes
          active ? super.merge!(aria: { current: 'page' }) : super
        end
      end
    end
  end
end
