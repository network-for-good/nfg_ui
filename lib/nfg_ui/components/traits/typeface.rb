# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module Typeface
        TRAITS = %i[body
                    caption
                    heading
                    title
                    muted].freeze

        def body_trait
          options[:as] = body_tag
        end

        # TODO: this was a tricky one and needs specs (as well as other traits need this spec)
        # Write a spec that tests that the typeface is ACTUALLY a caption
        # this was identified earlier as not happening because we'd set the as option
        # but it wasn't spitting out the caption css_class...
        # after some exploring it turned out the component didn't understand that it
        # was actually a caption... it just looked like one.
        def caption_trait
          options[:as] = caption_tag
          options[:caption] = body
        end

        def heading_trait
          options[:as] = heading_tag
          options[:heading] = body
        end

        def title_trait
          options[:as] = title_tag
          options[:title] = body
        end

        def muted_trait
          options[:class] += ' text-muted'
        end
      end
    end
  end
end
