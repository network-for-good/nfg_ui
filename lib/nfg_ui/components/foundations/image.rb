# frozen_string_literal: true

module NfgUi
  module Components
    module Foundations
      # Image doc coming soon
      class Image < NfgUi::Components::Base
        def render
          content_tag(:img, html_options) {}
        end
      end
    end
  end
end
