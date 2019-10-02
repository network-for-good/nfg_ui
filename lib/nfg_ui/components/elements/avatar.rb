# frozen_string_literal: true
module NfgUi
  module Components
    module Elements
      # Activity doc coming soon
      class Avatar < NfgUi::Components::Base
        include Bootstrap::Utilities::Sizable
        include Bootstrap::Utilities::Tooltipable
        include Bootstrap::Utilities::Wrappable

        include NfgUi::Components::Traits::Size

        def alt
          options.fetch(:alt, nil)
        end

        def image
          options.fetch(:image, nil)
        end

        def render
          content_tag(as, html_options) do
            if image.present?
              image_tag image, alt: alt.presence
            elsif body.present?
              content_tag(:span, (block_given? ? yield : body), class: body_css_class)
            end
          end
        end

        # Set the default size if no size is set.
        # Avatars, unlike other components, always have a size
        # provided to them.
        # This also rejects nil from fetching as a fallback
        def size
          options[:size] || default_size
        end

        private

        def body_css_class
          'avatar-text'
        end

        def default_html_wrapper_element
          :div
        end

        def default_size
          :md
        end

        def non_html_attribute_options
          super.push(:image, :alt)
        end

        # Sizable doesn't allow components to use illegal sizes (anything other than :sm or :lg)
        # When an illegal size is detected, it does not generate the size css class (e.g.: 'avatar-xl')
        #
        # nfg_ui implements more sizes than "sm" and "lg",
        # We set #resized? updated restrictions here, instead.
        # allowing updated size css classes to be passed to html_options
        def resized?
          [:sm, :md, :lg, :xl].include?(size)
        end
      end
    end
  end
end
