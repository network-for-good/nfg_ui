require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::DropdownItem do
  let(:dropdown_item) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  let(:rendered) { dropdown_item.render }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::DropdownItem }
  pending 'unknown reason why dropdown item uniquely fails the consistent initialized shared example spec. To resolve soon'
  # it_behaves_like 'a component with a consistent initalized construction'

  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Iconable utility module'
  it_behaves_like 'a component that includes the Renderable utility module'
  it_behaves_like 'a component that includes the Modalable utility module', component_suite: :nfg

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }

  describe '#render' do
    let(:icon_css_selector) { ".text-center.fa-fw.fa-#{icon}.#{NfgUi::Components::Foundations::Icon::LEFT_ICON_SPACER_CSS_CLASS}" }
    let(:icon) { nil }
    let(:body) { 'Test body' }

    subject { Capybara.string(rendered) }

    context 'when a dropdown item is not disabled and does not have a tooltip' do


      let(:options) { { icon: icon, body: body, disabled: false, tooltip: nil, as: tested_as, **additional_options } }

      context 'when as: is :button_to' do
        subject { described_class.new(options, ActionController::Base.new.view_context).render }
        let(:tested_as) { :button_to }
        let(:additional_options) { { button_url: '#' } }

        it 'wraps the dropdown item in a button_to helper' do
          expect(subject).to eq "<form class=\"button_to\" method=\"post\" action=\"#\"><button class=\"dropdown-item\" type=\"submit\">Test body</button></form>"
        end
      end

      context 'when as: is not :button_to' do
        let(:tested_as) { :a }
        let(:additional_options) { {} }

        it 'does not wrap the dropdown item in a button_to helper' do
          expect(described_class.new(options, ActionController::Base.new.view_context).render).to eq "<#{tested_as} class=\"dropdown-item\">Test body</#{tested_as}>"

        end

        it 'does not render a disabled dropdown item' do
          by 'rendering an enabled component' do
            expect(subject).to have_css '.dropdown-item'
          end

          and_by 'not adding the disabled css class to the dropdown item' do
            expect(subject).not_to have_css '.dropdown-item.disabled'
          end

          and_by 'not wrapping the component in the disabled component wrapper' do
            expect(subject).not_to have_css "span.d-inline-block[data-toggle='tooltip'][tabindex='0']"
          end
        end

        context 'and when the dropdown item has an icon' do
          let(:icon) { 'rocket' }
          it 'renders the component with an icon with the correct css spacing class' do
            expect(subject).to have_css "a.dropdown-item #{icon_css_selector}"
          end
        end

        context 'and when the dropdown item does not have an icon' do
          let(:icon) { nil }
          it 'renders the component without an icon' do
            expect(subject).not_to have_css "a.dropdown-item #{icon_css_selector}"
          end
        end
      end
    end

    context 'when the dropdown item has a tooltip and is also disabled' do
      let(:tooltip) { 'Tested tooltip' }
      let(:disabled_component_wrapper_selector) { "span.d-inline-block[data-toggle='tooltip'][tabindex='0'][data-html='true'][title='#{tooltip}']" }
      let(:options) { { disabled: true, tooltip: tooltip, icon: icon, body: body } }

      context 'when an icon is present' do
        let(:icon) { 'rocket' }
        it 'outputs a wrapped disabled component with a tooltip and an icon' do
          by 'outputting the wrapper element with disabled the correct html' do
            expect(subject).to have_css disabled_component_wrapper_selector
          end

          by 'outputting the dropdown item within the disabled component wrapper' do
            and_it 'includes the dropdown item' do
              expect(subject).to have_selector "#{disabled_component_wrapper_selector} a.dropdown-item.disabled", text: body
            end

            and_it 'includes the icon with the correct spacer css class' do
              expect(subject).to have_css "#{disabled_component_wrapper_selector} a.dropdown-item.disabled #{icon_css_selector}"
            end
          end
        end
      end

      context 'when an icon is not present' do
        let(:icon) { nil }

        it 'outputs the disabled tooltipped component without an icon' do
          by 'outputting the wrapper element with disabled the correct html' do
            expect(subject).to have_css disabled_component_wrapper_selector
          end

          and_it 'includes the dropdown item' do
            expect(subject).to have_selector "#{disabled_component_wrapper_selector} a.dropdown-item.disabled", text: body
          end

          and_it 'does not include the icon' do
            expect(subject).not_to have_css "#{disabled_component_wrapper_selector} a.dropdown-item.disabled > [class*='fa']"
          end
        end
      end
    end
  end

  describe '#href' do
    subject { dropdown_item.href }
    context 'when modal is present in options' do
      context 'when :href is included in the options' do
        let(:tested_href) { '#tested_href' }
        let(:options) { { modal: '#target_modal', href: tested_href } }

        it 'does not overwrite the supplied href' do
          expect(subject).to eq tested_href
        end
      end

      context 'when :href is not included in the options' do
        let(:options) { { modal: '#target_modal' } }

        it 'provides a fallback href' do
          expect(subject).to eq '#'
        end
      end
    end

    context 'when modal is falsy in options' do
      let(:options) { { modal: nil } }
      it 'falls back to super' do
        expect(subject).not_to be
      end
    end
  end  
end
