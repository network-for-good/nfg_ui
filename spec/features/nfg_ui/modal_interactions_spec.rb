require 'rails_helper'

# 1. Shared examples

# Required :let examples
# let(:dropdown) { false }
# let(:describe) { 'modal-button' }
# let(:modal_id) { '#test_modal' }
# let(:element) { '' }
shared_examples_for 'a modalable component that kicks off a modal' do
  it 'opens and closes the modal' do
    activate_modal(data_describe: describe, element: element, dropdown: dropdown, dropdown_data_describe: dropdown_data_describe)

    and_by 'confirming the modal is present' do
      wait_for_modal_animation
      expect(page).to have_css "body.modal-open #{modal_id}", visible: true
    end

    and_by 'closing the modal' do
      page.find('.modal-header .close').click
    end

    and_it 'closes the modal' do
      wait_for_modal_animation
      expect(page).not_to have_css 'body.modal-open'
      expect(page).to have_css modal_id, visible: false
    end
  end
end

# Required :let examples
# let(:dropdown) { true }
# let(:disabled_button_wrapper_describe) { 'modal-button-wrapper' }
# let(:modal_id) { '#test_modal' }
# let(:dropdown_data_describe) { 'the-toggle' }
shared_examples_for 'a disabled modalable component' do |tooltip: false|
  it 'does not enable a modal' do
    by 'attempting to activate the modal' do
      activate_modal(data_describe: disabled_button_wrapper_describe, element: element, dropdown: dropdown, dropdown_data_describe: dropdown_data_describe)
    end

    and_it 'does not activate the modal' do
      expect(page).not_to have_css 'body.modal-open'
    end

    if tooltip
      and_it 'allows the tooltip to be passed through to the component without raising an ArgumentError' do
        page.find('body').click # reset tooltips

        # Restart dropdown if needed
        maybe_open_dropdown_menu(maybe_open_dropdown: dropdown, dropdown_data_describe: dropdown_data_describe, nested_toggle: nested_toggle)

        by 'not having the tooltip html present on the page' do
          expect(page).not_to have_css '.tooltip'
        end
        and_by 'hovering the component' do
          find("[data-describe='#{disabled_button_wrapper_describe}'] [data-toggle='tooltip']").hover
          sleep 0.5
        end

        and_it 'activates the component tooltip' do
          expect(page).to have_css "[data-describe='#{disabled_button_wrapper_describe}'] [data-toggle='tooltip'][aria-describedby*='tooltip']"
        end

        and_it 'renders the tooltip on the page' do
          tooltip_id = page.find("[data-describe='#{disabled_button_wrapper_describe}'] [data-toggle='tooltip']")['aria-describedby']
          expect(page).to have_css ".tooltip[id='#{tooltip_id}']"
        end
      end
    end
  end
end

# Required :let examples
# let(:dropdown) { true }
# let(:describe) { 'modal-button' }
# let(:href) { ComponentAttributeDefaultsHelper::feature_spec_href }
# let(:dropdown_data_describe) { 'the-toggle' }
shared_examples_for 'modalable components with a pre-supplied href' do
  it 'does not overwrite the pre-supplied href' do
    maybe_open_dropdown_menu(maybe_open_dropdown: dropdown, dropdown_data_describe: dropdown_data_describe, nested_toggle: nested_toggle)

    and_it 'maintains the supplied href' do
      expect(page).not_to have_css "[data-describe='#{describe}'][href='#']"
      expect(page).to have_css "[data-describe='#{describe}'][href='#{href}']"
    end
  end
end

# Required :let examples
# let(:dropdown) { true }
# let(:anchorable_component) { true } # a button is not anchorable, a link is.
# let(:describe) { 'modal-button' }
# let(:dropdown_data_describe) { 'the-toggle' }
shared_examples_for 'modalable components without an href' do
  it 'supplies the default href on href-capable components' do
    maybe_open_dropdown_menu(maybe_open_dropdown: dropdown, dropdown_data_describe: dropdown_data_describe, nested_toggle: nested_toggle)

    if anchorable_component
      and_context 'when the component is anchorable' do
        expect(page).to have_css("[data-describe='#{describe}'][href='#']") 
      end
    end

    unless anchorable_component
      and_context 'when the component is not anchorable' do
        expect(page).to have_css("[data-describe='#{describe}']") # sanity check
        expect(page).not_to have_css("[data-describe='#{describe}'][href='#']")
      end
    end
  end
end

# Required :let examples
# let(:dropdown) { true }
# let(:describe) { 'modal-button' }
# let(:modal_id) { '#test_modal' }
shared_examples_for 'modalable components with a tooltip option in html that yields a nil tooltip' do
  it 'does not raise an ArgumentError when the tooltip is nil within the component options' do
    maybe_open_dropdown_menu(maybe_open_dropdown: dropdown, dropdown_data_describe: dropdown_data_describe, nested_toggle: nested_toggle)
    expect(page).to have_css "[data-describe='#{describe}'][data-toggle='modal'][data-target='#{modal_id}']"
    expect(page).not_to have_css "[data-describe='#{describe}'][data-toggle='tooltip']"
  end
end


# 2. Specs:
RSpec.describe 'Opening and closing a modal from all modalable components', type: :feature, js: true do
  let(:modal_id) { ComponentAttributeDefaultsHelper::feature_spec_modal_target }
  let(:nested_toggle) { false }

  before { visit modal_feature_spec_views_path }

  # Do what we can to ensure we're not missing some 
  # new modalable components along the way.
  it_behaves_like 'a page that contains all of the utility enhanced components', tested_method: :modal, component_suite: :nfg

  describe 'activating the modal' do
    let(:element) { '' }
    let(:dropdown_data_describe) { nil }
    let(:disabled_button_wrapper_describe) { nil }
    let(:describe) { nil }
    let(:scroll_to_target) { dropdown ? dropdown_data_describe : (describe || disabled_button_wrapper_describe) }

    before { scroll_to_element "[data-describe=\'#{scroll_to_target}\']" }

    describe 'opening and closing a modal from a regular rails `link_to`' do
      let(:dropdown) { false }

      context 'when the link has remote: true in its options' do
        let(:describe) { 'modal-link' }
        it_behaves_like 'a modalable component that kicks off a modal'
      end
    end

    describe 'opening and closing the modal with buttons' do
      let(:dropdown) { false }

      context 'a standard modal button (as a button element)' do
        let(:describe) { 'modal-button-as-button' }
        let(:element) { 'button' }
        let(:anchorable_component) { false }

        it_behaves_like 'a modalable component that kicks off a modal'
        it_behaves_like 'modalable components without an href'
      end

      context 'a standard modal button (as a link element)' do
        let(:element) { 'a' }
        let(:anchorable_component) { true }
        let(:describe) { 'modal-button-as-link' }

        it_behaves_like 'a modalable component that kicks off a modal'
        it_behaves_like 'modalable components without an href'
      end

      context 'a modal button link with a pre-supplied href' do
        let(:describe) { 'modal-button-as-link-with-href' }
        let(:element) { 'a' }
        let(:href) { ComponentAttributeDefaultsHelper::feature_spec_href }

        it_behaves_like 'a modalable component that kicks off a modal'
        it_behaves_like 'modalable components with a pre-supplied href'
      end

      context 'a disabled modal button' do
        let(:disabled_button_wrapper_describe) { 'disabled-button-wrapper' }

        it_behaves_like 'a disabled modalable component', tooltip: true
      end

      context 'a modal button with a competing data enriching tooltip in its ui.nfg options' do
        let(:describe) { 'modal-button-with-tooltip' }

        it_behaves_like 'a modalable component that kicks off a modal'
        it_behaves_like 'modalable components with a tooltip option in html that yields a nil tooltip'
      end
    end

    describe 'opening and closing a modal with dropdown items' do
      let(:dropdown) { true }
      let(:dropdown_data_describe) { 'dropdown-menu' }

      context 'a standard modalable dropdown item' do
        let(:anchorable_component) { true }
        let(:describe) { 'modal-dropdown-item' }

        it_behaves_like 'a modalable component that kicks off a modal'
        it_behaves_like 'modalable components without an href'
      end

      context 'a modalable dropdown item with a pre-supplied href' do
        let(:describe) { 'modal-dropdown-item-with-href' }
        let(:href) { ComponentAttributeDefaultsHelper::feature_spec_href }

        it_behaves_like 'a modalable component that kicks off a modal'
        it_behaves_like 'modalable components with a pre-supplied href'
      end

      context 'a modalable dropdown item with a competing tooltip' do
        let(:describe) { 'modal-dropdown-item-with-tooltip' }

        it_behaves_like 'a modalable component that kicks off a modal'
        it_behaves_like 'modalable components with a tooltip option in html that yields a nil tooltip'
      end

      context 'a disabled modalable dropdown item' do
        let(:disabled_button_wrapper_describe) { 'disabled-dropdown-item-wrapper' }

        it_behaves_like 'a disabled modalable component', tooltip: true
      end
    end

    # While slat actions inherit from DropdownItem, we should not
    # assume that their behavior and limitations are identical.
    describe 'opening and closing a modal with slat actions' do
      let(:nested_toggle) { true }
      let(:dropdown) { true }
      let(:dropdown_data_describe) { 'slat-actions-menu' }

      context 'a standard modalable slat action' do
        let(:anchorable_component) { true }
        let(:describe) { 'modal-slat-action' }

        it_behaves_like 'a modalable component that kicks off a modal'
        it_behaves_like 'modalable components without an href'
      end

      context 'a modalable slat action with a pre-supplied href' do
        let(:describe) { 'modal-slat-action-with-href' }
        let(:href) { ComponentAttributeDefaultsHelper::feature_spec_href }

        it_behaves_like 'a modalable component that kicks off a modal'
        it_behaves_like 'modalable components with a pre-supplied href'
      end

      context 'a modalable slat action with a competing tooltip' do
        let(:describe) { 'modal-slat-action-with-tooltip' }

        it_behaves_like 'a modalable component that kicks off a modal'
        it_behaves_like 'modalable components with a tooltip option in html that yields a nil tooltip'
      end

      context 'a disabled modalable slat action' do
        let(:disabled_button_wrapper_describe) { 'disabled-slat-action-wrapper' }

        it_behaves_like 'a disabled modalable component', tooltip: true
      end
    end
  end

  describe 'closing the modal from the modal footer button' do
    let(:dropdown) { false }
    it 'closes the modal when the modal footer button is clicked' do
      by 'activating the modal' do
        activate_modal(data_describe: 'modal-link')
      end

      and_by 'closing the modal from the modal footer button' do
        page.find("[data-describe='modal-footer-close-button']").click
      end

      wait_for_modal_animation

      and_it 'closes the modal' do
        expect(page).not_to have_css 'body.modal-open'
        expect(page).to have_css modal_id, visible: false
      end
    end
  end
end

private

def wait_for_modal_animation
  sleep 0.5
end

def activate_modal(data_describe:, element: '', dropdown: false, dropdown_data_describe: 'dropdown-menu')
  return if page.has_css?('.dropdown-menu.show')
  maybe_open_dropdown_menu(maybe_open_dropdown: dropdown, dropdown_data_describe: dropdown_data_describe, nested_toggle: nested_toggle)
  page.find("#{element}[data-describe='#{data_describe}']").click
  wait_for_modal_animation
end
