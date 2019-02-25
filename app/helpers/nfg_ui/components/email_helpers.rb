module NfgUi
  module Components
    module EmailHelpers
      def spacer(size)
        # Used in situations where you're utilizing a spacer value based on 12, ex:
        # %spacer{ size: spacer(:double) } is the same as %spacer{ size: "24" }
        case size
        when :quarter then spacer_base / 4
        when :half then spacer_base / 2
        when :base then spacer_base
        when :base_half then spacer_base * 1.5
        when :double then spacer_base * 2
        when :double_half then spacer_base * 2.5
        when :triple then spacer_base * 3
        when :triple_half then spacer_base * 3.5
        when :quadruple then spacer_base * 4
        when :quadruple_half then spacer_base * 4.5
        else
          size # allows for backup scenarios like %spacer{ size: spacer(120) }
        end
      end

      def theme_color(theme_color)

        # Centralizes theme color utilization (like spacer), ex:
        # = render "product_content", theme_color: theme_color(:primary)
        case theme_color
        when :primary then "primary"
        when :success then "success"
        when :warning then "warning"
        when :alert then "alert"
        end
      end

      private

      def spacer_base
        12
      end
    end
  end
end