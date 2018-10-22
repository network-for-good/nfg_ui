require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::NavItem do
  let(:nav_item) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module'

  describe '#active' do
    subject { nav_item.active }
    context 'when active is true in options' do
      let(:options) { { active: true } }
      it { is_expected.to be }
    end

    context 'when active is nil in options' do
      let(:options) { { active: nil } }
      it { is_expected.to be_nil }
    end

    context 'when active is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#button' do
    subject { nav_item.button }
    context 'when button is present in options' do
      let(:tested_button) { 'test button' }
      let(:options) { { button: tested_button } }
      it { is_expected.to eq tested_button }
    end

    context 'when button is nil in options' do
      let(:options) { { button: nil } }
      it { is_expected.to be_nil }
    end

    context 'when button is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#component_family' do
    subject { nav_item.component_family }
    it { is_expected.to eq :nav }
  end

  describe '#disabled' do
    subject { nav_item.disabled }
    context 'when disabled is true in options' do
      let(:options) { { disabled: true } }
      it { is_expected.to be }
    end

    context 'when disabled is nil in options' do
      let(:options) { { disabled: nil } }
      it { is_expected.to be_nil }
    end

    context 'when disabled is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#dropdown' do
    subject { nav_item.dropdown }
    context 'when dropdown is true in options' do
      let(:options) { { dropdown: true } }
      it { is_expected.to be }
    end

    context 'when dropdown is nil in options' do
      let(:options) { { dropdown: nil } }
      it { is_expected.to be_nil }
    end

    context 'when dropdown is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#href' do
    subject { nav_item.href }
    context 'when href is present in options' do
      let(:tested_href) { 'tested-href' }
      let(:options) { { href: tested_href } }
      it { is_expected.to eq tested_href }
    end

    context 'when href is not present in options' do
      let(:options) { { href: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe '#include_nav_link?' do
    subject { nav_item.include_nav_link? }
    context 'when href is present' do
      let(:options) { { href: tested_href, as: tested_as, dropdown: tested_dropdown } }
      let(:tested_href) { nil }
      let(:tested_dropdown) { nil }
      let(:tested_as) { nil }

      context 'when options[:as] is present' do
        let(:tested_as) { :strong }
        it { is_expected.not_to be }

        context 'when dropdown is present' do
          let(:tested_dropdown) { true }
          it { is_expected.to be }
        end
      end

      context 'when options[:as] is not present' do
        let(:tested_as) { nil }
        it { is_expected.not_to be }

        context 'when dropdown is present' do
          let(:tested_dropdown) { true }
          it { is_expected.to be }
        end
      end
    end

    context 'when href is not present' do
      let(:options) { { href: nil } }
      it { is_expected.not_to be }
    end

    describe 'dropdown presence' do
      let(:options) { { dropdown: tested_dropdown } }
      context 'when dropdown is present' do
        let(:tested_dropdown) { true }
        it { is_expected.to be }

        context 'when options[:as] is present' do
          let(:options) { { dropdown: tested_dropdown, as: :strong } }
          it { is_expected.to be }
        end
      end
    end

    context 'when tab is true' do
      let(:options) { { tab: true } }
      it { is_expected.to be }
    end
  end

  describe '#tab' do
    subject { nav_item.tab }
    context 'when tab is true in options' do
      let(:tested_tab) { 'tested-tab' }
      let(:options) { { tab: tested_tab } }
      it { is_expected.to eq tested_tab }
    end

    context 'when tab is nil in options' do
      let(:options) { { tab: nil } }
      it { is_expected.to be_nil }
    end

    context 'when tab is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#automatic_as' do
    subject { nav_item.send(:automatic_as) }

    context 'when include_nav_link? is true' do
      let(:options) { { dropdown: true } }
      it { is_expected.to eq :li }
    end

    context 'when include_nav_link? is false' do
      let(:options) { { dropdown: false } }
      it { is_expected.to eq nav_item.send(:default_html_wrapper_element) }

      context 'and when :as is supplied in options' do
        let(:options) { { as: :strong } }

        it 'still utilizes the default_html_wrapper_element' do
          expect(subject).to eq nav_item.send(:default_html_wrapper_element)
        end
      end

      context 'and when :as is not supplied in options' do
        let(:options) { {} }
        it { is_expected.to eq nav_item.send(:default_html_wrapper_element) }
      end
    end
  end

  describe '#css_classes' do
    subject { nav_item.send(:css_classes) }

    context 'when :dropdown is true' do
      let(:options) { { dropdown: true } }
      it { is_expected.to include 'dropdown' }
    end

    context 'when :nav_link is false' do
      let(:options) { { dropdown: false } }
      it { is_expected.not_to include 'dropdown' }
    end
  end

  describe '#default_html_wrapper_element' do
    subject { nav_item.send(:default_html_wrapper_element) }
    it { is_expected.to eq :li }
  end

  describe '#non_html_attribute_options' do
    subject { nav_item.send(:non_html_attribute_options) }
    it { is_expected.to include(:active,
                                :disabled,
                                :dropdown,
                                :button,
                                :href,
                                :tab) }
  end
end
