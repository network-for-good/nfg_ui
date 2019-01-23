require 'rails_helper'

# Required :let examples
# let(:dropdown) { false }
# let(:describe) { 'modal-button' }
# let(:modal_id) { '#test_modal' }
# let(:element) { '' }
shared_examples_for 'a modalable component that kicks off a modal' do
  it 'opens and closes the modal' do
    activate_modal(data_describe: describe, element: element, dropdown: dropdown)

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
shared_examples_for 'a disabled modalable component' do |tooltip: false|
  it 'does not enable a modal' do
    by 'attempting to activate the modal' do
      activate_modal(data_describe: disabled_button_wrapper_describe, element: element, dropdown: dropdown)
    end

    and_it 'does not activate the modal' do
      expect(page).not_to have_css 'body.modal-open'
    end

    if tooltip
      and_it 'allows the tooltip to be passed through to the component without raising an ArgumentError' do
        page.find('body').click # reset tooltips

        # Restart dropdown if needed
        maybe_open_dropdown_menu(dropdown: dropdown)

        by 'not having the tooltip html present on the page' do
          expect(page).not_to have_css '.tooltip'
        end
        and_by 'hovering the component' do
          find("[data-describe='#{disabled_button_wrapper_describe}']").hover
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
# let(:href) { '#included_href' }
shared_examples_for 'modalable components with a pre-supplied href' do
  it 'does not overwrite the pre-supplied href' do
    maybe_open_dropdown_menu(dropdown: dropdown)

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
shared_examples_for 'modalable components without an href' do
  it 'supplies the default href on href-capable components' do
    maybe_open_dropdown_menu(dropdown: dropdown)

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
    maybe_open_dropdown_menu(dropdown: dropdown)
    expect(page).to have_css "[data-describe='#{describe}'][data-toggle='modal'][data-target='#{modal_id}']"
    expect(page).not_to have_css "[data-describe='#{describe}'][data-toggle='tooltip']"
  end
end

RSpec.describe 'Opening and closing a modal from various modalable components', type: :feature, js: true do
  let(:modal_id) { '#test_modal' }
  let(:element) { '' }

  before { visit modal_feature_spec_views_path }

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
      let(:href) { '#included_href' }

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

    context 'a standard modalable dropdown item' do
      let(:anchorable_component) { true }
      let(:describe) { 'modal-dropdown-item' }

      it_behaves_like 'a modalable component that kicks off a modal'
      it_behaves_like 'modalable components without an href'
    end

    context 'a modalable dropdown item with a pre-supplied href' do
      let(:describe) { 'modal-dropdown-item-with-href' }
      let(:href) { '#included_href' }

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

    context 'when the component does not include remote: true in its options' do
      let(:describe) { 'modal-dropdown-item' }
      it_behaves_like 'a modalable component that kicks off a modal'
    end

    context 'when the component includes remote: true in its options' do
      let(:describe) { 'modal-dropdown-item-with-remote' }
    end
  end

  describe 'closing the modal from the modal footer button' do
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

def activate_modal(data_describe:, element: '', dropdown: false)
  return if page.has_css?('.dropdown-menu.show')
  maybe_open_dropdown_menu(dropdown: dropdown)
  page.find("#{element}[data-describe='#{data_describe}']").click
  wait_for_modal_animation
end

def maybe_open_dropdown_menu(dropdown:)
  page.find("[data-describe='dropdown-menu']").click if dropdown
end
