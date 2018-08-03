# frozen_string_literal: true

module NfgUi
  module Bootstrap
    module Components
      # Bootstrap Responsive Embed Component
      # https://getbootstrap.com/docs/4.1/utilities/embed/
      class Embed < Bootstrap::Components::Base
        # attr_reader :aspect_ratio,
        #             :autoplay

        # def initialize(*)
        #   super
        #   @autoplay = options.fetch(:autoplay, default_autoplay)
        #   @iframe = iframe if iframe?
        #   @aspect_ratio = options.fetch(:aspect_ratio, default_aspect_ratio)
        # end

        def aspect_ratio
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:aspect_ratio, default_aspect_ratio) || default_aspect_ratio
        end

        def iframe
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          return unless iframe?
          view_context.content_tag :iframe, nil, src: src, class: 'embed-responsive-item', allowfullscreen: true
        end

        def iframe?
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          options[:iframe].present?
        end

        def autoplay
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          options.fetch(:autoplay, default_autoplay)
        end

        private

        def component_css_class
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          'embed-responsive'
        end

        def src
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          return unless iframe?
          options[:iframe] + (autoplay ? '?autoplay=1' : '')
        end

        def css_classes
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          return super unless allowed_aspect_ratios.include?(aspect_ratio)
          super + " embed-responsive-#{aspect_ratio.gsub("\:", 'by')}"
        end

        def allowed_aspect_ratios
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          %w[21:9 16:9 4:3 1:1]
        end

        def default_aspect_ratio
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          '16:9'
        end

        # def default_iframe
        #   ''
        # end

        def non_html_attribute_options
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          super.push(:iframe, :aspect_ratio, :autoplay)
        end

        # def defaults
        #   super.merge!(iframe: default_iframe,
        #                aspect_ratio: default_aspect_ratio,
        #                autoplay: default_autoplay)
        # end

        def default_autoplay
          p "====== Printed from: (Bootstrap::Components::Embed) self.class.name: #{self.class.name} method: #{__method__}"
          false
        end
      end
    end
  end
end
