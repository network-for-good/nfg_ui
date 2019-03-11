# frozen_string_literal: true

# Replace escaped HTML with uniform alternatives
#
# This allows for much easier checking of whether or not
# the rendered HTML string includes a specific substring.
#
# Example usage:
# let(:rendered_component) { view_context.ui.nfg(:button, options) }
# subject { uniform_rendered_component(rendered_component) }
# etc...

def uniform_rendered_component(rendered_component)
  rendered_component.tr('\"', "'").tr("\n", '')
end
