require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Nav do
  let(:nav) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Alignable utility module'

  describe '#component_family' do
    subject { nav.component_family }
    it { is_expected.to eq :nav }
  end

  describe '#fill' do
    subject { nav.fill }
    context 'when fill is true' do
      let(:options) { { fill: true } }
      it { is_expected.to be }
    end

    context 'when fill is false' do
      let(:options) { { fill: false } }
      it { is_expected.not_to be }
    end

    context 'when fill is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#justified' do
    subject { nav.justified }
    context 'when justified is true' do
      let(:options) { { justified: true } }
      it { is_expected.to be }
    end

    context 'when justified is false' do
      let(:options) { { justified: false } }
      it { is_expected.not_to be }
    end

    context 'when justified is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#pill' do
    subject { nav.pill }
    context 'when pill is true' do
      let(:options) { { pill: true } }
      it { is_expected.to be }
    end

    context 'when pill is false' do
      let(:options) { { pill: false } }
      it { is_expected.not_to be }
    end

    context 'when pill is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#tabs' do
    subject { nav.tabs }
    context 'when tabs is true' do
      let(:options) { { tabs: true } }
      it { is_expected.to be }
    end

    context 'when tabs is false' do
      let(:options) { { tabs: false } }
      it { is_expected.not_to be }
    end

    context 'when tabs is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#vertical' do
    subject { nav.vertical }
    context 'when vertical is true' do
      let(:options) { { vertical: true } }
      it { is_expected.to be }
    end

    context 'when vertical is false' do
      let(:options) { { vertical: false } }
      it { is_expected.not_to be }
    end

    context 'when vertical is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { nav.send(:css_classes) }

      describe ':fill option' do
        context 'when fill is true' do
          let(:options) { { fill: true } }
          it { is_expected.to include 'nav-fill' }
        end

        context 'when fill is false' do
          let(:options) { { fill: false } }
          it { is_expected.not_to include 'nav-fill' }
        end

        context 'when fill is not set' do
          let(:options) { {} }
          it { is_expected.not_to include 'nav-fill' }
        end
      end

      describe ':justified option' do
        context 'when justified is true' do
          let(:options) { { justified: true } }
          it { is_expected.to include 'nav-justified' }
        end

        context 'when justified is false' do
          let(:options) { { justified: false } }
          it { is_expected.not_to include 'nav-justified' }
        end

        context 'when justified is not set' do
          let(:options) { {} }
          it { is_expected.not_to include 'nav-justified' }
        end
      end

      describe ':pill option' do
        context 'when pill is true' do
          let(:options) { { pill: true } }
          it { is_expected.to include 'nav-pill' }
        end

        context 'when pill is false' do
          let(:options) { { pill: false } }
          it { is_expected.not_to include 'nav-pill' }
        end

        context 'when pill is not set' do
          let(:options) { {} }
          it { is_expected.not_to include 'nav-pill' }
        end
      end

      describe ':tabs option' do
        context 'when tab is true' do
          let(:options) { { tabs: true } }
          it { is_expected.to include 'nav-tabs' }
        end

        context 'when tab is false' do
          let(:options) { { tabs: false } }
          it { is_expected.not_to include 'nav-tabs' }
        end

        context 'when tab is not set' do
          let(:options) { {} }
          it { is_expected.not_to include 'nav-tabs' }
        end
      end

      describe ':vertical option' do
        context 'when vertical is true' do
          let(:options) { { vertical: true } }
          it { is_expected.to include 'flex-column' }
        end

        context 'when vertical is false' do
          let(:options) { { vertical: false } }
          it { is_expected.not_to include 'flex-column' }
        end

        context 'when vertical is not set' do
          let(:options) { {} }
          it { is_expected.not_to include 'flex-column' }
        end
      end
    end

    describe '#default_html_wrapper_element' do
      subject { nav.send(:default_html_wrapper_element) }
      it { is_expected.to eq :ul }
    end

    describe '#non_html_attribute_options' do
      subject { nav.send(:non_html_attribute_options) }
      it { is_expected.to include(:fill,
                                  :justified,
                                  :tabs,
                                  :pill,
                                  :vertical) }
    end

    describe '#assistive_html_attributes' do
      let(:options) { { tabs: test_tabs } }
      subject { nav.send(:assistive_html_attributes) }
      context 'when :tabs is true' do
        let(:test_tabs) { true }
        it { is_expected.to include(role: 'tab-list') }
      end
      context 'when :tabs is falsy' do
        let(:test_tabs) { nil }
        it { is_expected.not_to include(role: 'tab-list') }
      end
    end
  end
end
