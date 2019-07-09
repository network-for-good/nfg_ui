require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ButtonGroup do
  let(:button_group) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  subject { described_class }

  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Sizable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the DropdownDirectionable utility module'

  describe '#render' do
    let(:rendered_html) { button_group.render }
    let(:options) { {} }
    subject { Capybara.string(rendered_html) }

    describe 'html output for the bootstrap button_group' do
      let(:options) { { body: body } }
      let(:body) { 'test body content' }

      it 'outputs a bootstrap button_group component in html' do
        expect(subject).to have_css '.btn-group'
        expect(subject).to have_selector '.btn-group', text: body
        expect(rendered_html).to eq "<div class=\"btn-group\" role=\"group\" aria-label=\"action buttons\">#{body}</div>"
      end
    end

    describe 'dropdown menu directions when acting as a container for a dropdown menu' do
      describe 'dropdown menu with dropleft direction' do
        context 'when dropleft is true in options' do
          let(:options) { { dropleft: true } }

          it 'outputs a dropdown component with dropleft html in place' do
            expect(subject).to have_css '.btn-group.dropleft'
            expect(rendered_html).to eq "<div class=\"btn-group dropleft\" role=\"group\" aria-label=\"action buttons\"></div>"
          end
        end

        context 'when dropleft is false in options' do
          let(:options) { { dropleft: false } }
          it 'outputs a dropdown component without dropleft html in place' do
            expect(subject).not_to have_css '.btn-group.dropleft'
            expect(subject).to have_css '.btn-group'
            expect(rendered_html).to eq "<div class=\"btn-group\" role=\"group\" aria-label=\"action buttons\"></div>"
          end
        end

        context 'when dropleft is not present in options' do
          let(:options) { {} }
          it { is_expected.not_to have_css '.btn-group.dropleft' }
          it { is_expected.to have_css '.btn-group' }
        end
      end

      describe 'dropdown menu with dropright direction' do
        context 'when dropright is true in options' do
          let(:options) { { dropright: true } }
          it 'outputs a dropdown component with dropright html in place' do
            expect(subject).to have_css '.btn-group.dropright'
            expect(rendered_html).to eq "<div class=\"btn-group dropright\" role=\"group\" aria-label=\"action buttons\"></div>"
          end
        end

        context 'when dropright is false in options' do
          let(:options) { { dropright: false } }
          it 'outputs a dropdown component without dropright html in place' do
            expect(subject).not_to have_css '.btn-group.dropright'
            expect(subject).to have_css '.btn-group'
            expect(rendered_html).to eq "<div class=\"btn-group\" role=\"group\" aria-label=\"action buttons\"></div>"
          end
        end

        context 'when dropright is not present in options' do
          let(:options) { {} }
          it { is_expected.not_to have_css '.btn-group.dropright' }
          it { is_expected.to have_css '.btn-group' }
        end
      end

      describe 'dropdown menu with dropup direction' do
        context 'when dropup is true in options' do
          let(:options) { { dropup: true } }
          it 'outputs a dropdown component with dropup html in place' do
            expect(subject).to have_css '.btn-group.dropup'
            expect(rendered_html).to eq "<div class=\"btn-group dropup\" role=\"group\" aria-label=\"action buttons\"></div>"
          end
        end

        context 'when dropup is false in options' do
          let(:options) { { dropup: false } }
          it 'outputs a dropdown component without dropup html in place' do
            expect(subject).not_to have_css '.btn-group.dropup'
            expect(subject).to have_css '.btn-group'
            expect(rendered_html).to eq "<div class=\"btn-group\" role=\"group\" aria-label=\"action buttons\"></div>"
          end
        end

        context 'when dropup is not present in options' do
          let(:options) { {} }
          it { is_expected.not_to have_css '.btn-group.dropup' }
          it { is_expected.to have_css '.btn-group' }
        end
      end
    end
  end

  describe '#vertical' do
    let(:options) { { vertical: tested_vertical } }
    let(:tested_vertical) { nil }
    subject { button_group.vertical }

    context 'when vertical is true' do
      let(:tested_vertical) { true }
      it { is_expected.to be }
    end

    context 'when vertical is false' do
      let(:tested_vertical) { false }
      it { is_expected.to be false }
    end

    context 'when vertical is nil' do
      let(:tested_vertical) { nil }
      it { is_expected.to be_falsey }
    end

    context 'when vertical is not present' do
      let(:options) { {} }
      it { is_expected.to be_falsey }
    end
  end

  describe 'private methods' do
    describe '#assistive_html_attributes' do
      subject { button_group.send(:assistive_html_attributes) }
      it { is_expected.to eq(role: 'group', aria: { label: 'action buttons' }) }
    end

    describe '#component_css_class' do
      subject { button_group.send(:component_css_class) }
      it { is_expected.to eq 'btn-group' }
    end

    describe '#css_classes' do
      subject { button_group.send(:css_classes) }
      pending 'spec needed for button_group#css_classes'
    end
  end
end
