module NfgUi
  module Components
    module Traits
      # Step traits
      module SlatItem
        TRAITS = %i[:truncate].freeze

        # truncated_trait is added to a slat_item when a slat_item typeface child
        # needs to have truncated text with ellipses.
        #
        # This is necessary because of the flex child containing the other text elements 
        # won't narrow past the "implied width" of those text elements.
        # when a min-width value is set.
        #
        # The flexbox child typeface component is then given the text-truncate class
        # 
        # Example in HAML:
        # = ui.nfg :slat_item, :truncated do
        #   = ui.nfg :typeface, heading: guest.email, class: 'text-truncate'
        # 
        # Read more: https://css-tricks.com/flexbox-truncated-text/
        def truncate_trait
          options[:style] = [options.try(:[], :style), 'min-width: 0;'].join(' ').squish
        end
      end
    end
  end
end
