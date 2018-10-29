require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Badge do
  let(:badge) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { { pill: pill_presence } }
  let(:pill_presence) { nil }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module'
  it_behaves_like 'a component that includes the Wrappable utility module'

  describe '#pill' do
    context 'when pill is true' do
      let(:pill_presence) { true }
      it { expect(badge.options[:pill]).to be }
    end

    context 'when pill is false' do
      let(:pill_presence) { false }
      it { expect(badge.options[:pill]).to be false }
    end

    context 'when pill is not present' do
      let(:pill_presence) { nil }
      it { expect(badge.options[:pill]).to be_falsey }
    end
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { badge.send(:css_classes) }

      context 'when pill is true' do
        let(:pill_presence) { true }
        it { is_expected.to eq 'badge badge-primary badge-pill' }
      end

      context 'when pill is determined false' do
        let(:pill_presence) { false }
        it { is_expected.not_to include 'badge-pill' }
      end
    end

    describe '#default_html_wrapper_element' do
      subject { badge.send(:default_html_wrapper_element) }
      it { is_expected.to eq :span }
    end

    describe '#non_html_attribute_options' do
      subject { badge.send(:non_html_attribute_options) }
      it { is_expected.to include(:pill) }
    end
  end
end
