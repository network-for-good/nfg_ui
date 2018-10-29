# frozen_string_literal: true

module NfgUi
  module Components
    module Traits
      # Access to pre-designed Alert traits
      module Typeface
        TRAITS = %i[body
                    caption
                    heading
                    title].freeze

        def body_trait
          options[:as] = body_tag
        end

        def caption_trait
          options[:as] = caption_tag
        end

        def heading_trait
          options[:as] = heading_tag
        end

        def title_trait
          options[:as] = title_tag
        end
        
      end
    end
  end
end
