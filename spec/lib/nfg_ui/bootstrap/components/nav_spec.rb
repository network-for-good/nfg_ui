require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Nav do
  let(:nav) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module'

  describe '#center' do
    subject { nav.center }
    context 'when center is true' do
      let(:options) { { center: true } }
      it { is_expected.to be }
    end

    context 'when center is false' do
      let(:options) { { center: false } }
      it { is_expected.not_to be }
    end

    context 'when center is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

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

  describe '#pills' do
    subject { nav.pills }
    context 'when pills is true' do
      let(:options) { { pills: true } }
      it { is_expected.to be }
    end

    context 'when pills is false' do
      let(:options) { { pills: false } }
      it { is_expected.not_to be }
    end

    context 'when pills is not set' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#right' do
    subject { nav.right }
    context 'when right is true' do
      let(:options) { { right: true } }
      it { is_expected.to be }
    end

    context 'when right is false' do
      let(:options) { { right: false } }
      it { is_expected.not_to be }
    end

    context 'when right is not set' do
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

  describe '#css_classes' do
    subject { nav.send(:css_classes) }

    describe ':center option' do
      context 'when center is true' do
        let(:options) { { center: true } }
        it { is_expected.to include 'justify-content-center' }
      end

      context 'when center is false' do
        let(:options) { { center: false } }
        it { is_expected.not_to include 'justify-content-center' }
      end

      context 'when center is not set' do
        let(:options) { {} }
        it { is_expected.not_to include 'justify-content-center' }
      end
    end

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

    describe ':pills option' do
      context 'when pill is true' do
        let(:options) { { pills: true } }
        it { is_expected.to include 'nav-pills' }
      end

      context 'when pill is false' do
        let(:options) { { pills: false } }
        it { is_expected.not_to include 'nav-pills' }
      end

      context 'when pill is not set' do
        let(:options) { {} }
        it { is_expected.not_to include 'nav-pills' }
      end
    end

    describe ':right option' do
      context 'when right is true' do
        let(:options) { { right: true } }
        it { is_expected.to include 'justify-content-end' }
      end

      context 'when right is false' do
        let(:options) { { right: false } }
        it { is_expected.not_to include 'justify-content-end' }
      end

      context 'when right is not set' do
        let(:options) { {} }
        it { is_expected.not_to include 'justify-content-end' }
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
                                :pills,
                                :right,
                                :center,
                                :vertical) }
  end
end
