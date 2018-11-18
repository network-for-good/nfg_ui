# frozen_string_literal: true

module NfgUi
  module Components
    module Patterns
      # Slat doc coming soon
      class SlatActions < NfgUi::Components::Base
        include NfgUi::Components::Utilities::Iconable

        include NfgUi::Components::Traits::Theme

        def component_family
          :slats
        end

        def menu
          options.fetch(:menu, true)
        end

        def confirm
          options.fetch(:confirm, nil)
        end

        def method
          options.fetch(:method, nil)
        end

        def slat_header
          options.fetch(:slat_header, false)
        end

        def wide
          options.fetch(:wide, true)
        end

        def disable_with
          options.fetch(:disable_with, nil)
        end

        def remote
          options.fetch(:remote, nil)
        end

        def action_link_html_options
          { href: href,
            class: [
                     (theme ? "text-#{theme}" : ''),
                     'd-block'
                   ].join(' ').squish,
            method: send(:method),
            remote: remote,
            data: { disable_with: disable_with,
                    confirm: confirm } }
        end

        def theme
          options.fetch(:theme, nil)
        end

        private

        def css_classes
          [
            super,
            ("#{component_css_class}-sm" unless wide),
            ('line-height-sm' if href.present?)
          ].join(' ').squish
        end

        def non_html_attribute_options
          super.push(:slat_header, :wide, :menu, :theme, :method, :remote, :confirm, :disable_with)
        end
      end
    end
  end
end
