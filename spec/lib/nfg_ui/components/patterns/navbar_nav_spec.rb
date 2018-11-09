require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::NavbarNav do
  let(:navbar_nav) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::NavbarNav }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Wrappable utility module'
  it_behaves_like 'a component that includes the Renderable utility module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }

  pending 'specs needed'

  describe '#right' do
    subject { navbar_nav.right }
    context 'when right is true in options' do
      let(:options) { { right: true } }
      it { is_expected.to be }
    end

    context 'when right is not present in options' do
      let(:options) { {} }
      it { is_expected.not_to be }
    end
  end

  describe '#left' do
    subject { navbar_nav.left }
    context 'when left is true in options' do
      let(:options) { { left: true } }
      it { is_expected.to be }
    end

    context 'when left is not present in options' do
      let(:options) { {} }
      it { is_expected.to be }

      context 'when right is true in options' do
        let(:options) { { right: true } }
        it { is_expected.not_to be }
      end

      context 'when right is false in options' do
        let(:options) { { right: false } }
        it { is_expected.to be }
      end

      context 'when right is not present in options' do
        let(:options) { {} }
        it { is_expected.to be }
      end
    end
  end

  describe '#css_classes' do
    subject { navbar_nav.send(:css_classes) }

    describe ':left option' do
      context 'when :left is true' do
        let(:options) { { left: true } }
        it { is_expected.to include 'mr-auto' }
      end

      context 'when :left is false' do
        let(:options) { { left: false } }
        it { is_expected.not_to include 'mr-auto' }
      end

      context 'when :left is nil' do
        let(:options) { { left: nil } }
        it { is_expected.not_to include 'mr-auto' }
      end

      context 'when :left is not present in options' do
        let(:options) { {} }
        it { is_expected.to include 'mr-auto' }
      end
    end

    describe ':right option' do
      context 'when :right is true' do
        let(:options) { { right: true } }
        it { is_expected.to include 'ml-auto' }
      end

      context 'when :right is false' do
        let(:options) { { right: false } }
        it { is_expected.not_to include 'ml-auto' }
      end

      context 'when :right is nil' do
        let(:options) { { right: nil } }
        it { is_expected.not_to include 'ml-auto' }
      end

      context 'when :right is not present in options' do
        let(:options) { {} }
        it { is_expected.not_to include 'ml-auto' }
        it { is_expected.to include 'mr-auto' }
      end
    end
  end

  describe '#default_html_wrapper_element' do
    subject { navbar_nav.send(:default_html_wrapper_element) }
    it { is_expected.to eq :ul }
  end

  describe '#default_left' do
    subject { navbar_nav.send(:default_left) }
    context 'when right is true' do
      let(:options) { { right: true } }
      it { is_expected.not_to be }
    end

    context 'when right is falsey' do
      it { is_expected.to be }
    end
  end
end
