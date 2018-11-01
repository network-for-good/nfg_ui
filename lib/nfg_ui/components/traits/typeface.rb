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
