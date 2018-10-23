require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Navbar do
  let(:navbar) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Wrappable utility module'

  describe '#assistive_html_attributes' do
    subject { navbar.send(:assistive_html_attributes) }
    context 'when the navbar is wrapped by a <nav> element' do
      let(:options) { { as: :nav } }
      it { is_expected.to eq({}) }
    end

    context 'when the navbar is not wrapped by a <nav> element' do
      let(:options) { { as: :div } }
      it { is_expected.to eq(role: 'navigation') }
    end
  end

  describe '#component_family' do
    subject { navbar.component_family }
    it { is_expected.to eq :navbar }
  end

  describe '#default_html_wrapper_element' do
    subject { navbar.send(:default_html_wrapper_element) }
    it { is_expected.to eq :nav }
  end
end
