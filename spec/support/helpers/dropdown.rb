# frozen_string_literal: true

# note: if multiple dropdown menus are present
# pass in the unique dropdown's data-describe.
#
# Note:
# All dropdown menus being tested in the feature spec must, at minimum,
# include the `data-describe='dropdown-menu'` html attribute
def maybe_open_dropdown_menu(maybe_open_dropdown:, dropdown_data_describe: 'dropdown-menu', nested_toggle: false)
  page.find('body').click # reset dropdown
  page.find("[data-describe='#{dropdown_data_describe}']#{' .dropdown-toggle' if nested_toggle}").click if maybe_open_dropdown
  sleep 0.5
end
