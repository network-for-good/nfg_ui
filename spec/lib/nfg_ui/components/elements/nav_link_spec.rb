require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::NavLink do
  let(:nav_link) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::NavLink }
  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Renderable utility module'
  it_behaves_like 'a component that includes the Modalable utility module', component_suite: :nfg

  # Because we uniquely apply where the modalable attributes are applied (a content_tag and not a component)
  # we don't worry about the `as: :a` version of this shared example.
  it_behaves_like 'a component that includes the CollapseToggleable utility module', component_suite: :nfg, skip_link_href_test: true

  it_behaves_like 'a component that includes the Iconable utility module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }

  describe '#render' do
    let(:options) { { dropdown: tested_dropdown, body: tested_body, icon: tested_icon } }
    let(:tested_body) { 'test body' }
    let(:tested_dropdown) { nil }
    let(:tested_icon) { nil }

    let(:rendered_html) { nav_link.render }
    subject { Capybara.string(rendered_html) }

    context 'when :dropdown is true' do
      let(:tested_dropdown) { true }
      it 'renders the nav link as a dropdown toggle' do
        expect(rendered_html).to eq "<a class=\"dropdown-toggle nav-link\" data-toggle=\"dropdown\" href=\"#\" aria-haspopup=\"true\" aria-expanded=\"false\">#{tested_body}<i aria-hidden=\"true\" class=\"fa fa-caret-down #{NfgUi::Components::Foundations::Icon::RIGHT_ICON_SPACER_CSS_CLASS}\"></i></a>"
      end

      context 'and when an icon is present in options' do
        let(:tested_icon) { 'heart' }

        it 'does not render the icon on the dropdown toggle' do
          expect(subject).not_to have_css ".fa-#{tested_icon}"
        end
      end
    end

    context 'when :dropdown is falsy' do
      let(:tested_dropdown) { false }
      it 'does not render the nav-link as a dropdown toggle' do
        expect(rendered_html).to eq "<a class=\"nav-link\">#{tested_body}</a>"
        expect(subject).not_to have_css '.dropdown-toggle'
      end

      context 'when an icon is present in options' do
        let(:tested_icon) { 'heart' }
        it 'renders the icon on the nav-link' do
          expect(subject).to have_css ".fa-#{tested_icon}"
          expect(subject).to have_css "i[aria-hidden]"
          expect(rendered_html).to eq "<a class=\"nav-link\"><i aria-hidden=\"true\" class=\"fa fa-#{tested_icon} #{NfgUi::Components::Foundations::Icon::LEFT_ICON_SPACER_CSS_CLASS}\"></i> #{tested_body}</a>"
        end
      end

      context 'and when an icon is not present' do
        let(:tested_icon) { nil }
        it 'does not add an icon to the nav-link' do
          expect(subject).not_to have_css '.fa'
          expect(subject).not_to have_css "i[aria-hidden]"
        end
      end
    end
  end
end
