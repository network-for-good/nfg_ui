# frozen_string_literal: true

def uniform_rendered_component(rendered_component)
  rendered_component.tr('\"', "'").tr("\n", '')
end
