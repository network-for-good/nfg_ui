require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::BreadcrumbItem do
  let(:breadcrumb_item) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  subject { described_class }

  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Activatable utility module'

  describe '#component_family' do
    subject { breadcrumb_item.component_family }
    it { is_expected.to eq :breadcrumb }
  end

  describe '#assistive_html_attributes' do
    subject { breadcrumb_item.send(:assistive_html_attributes) }
    context 'when the breadcrumb has :active set to true in options' do
      let(:options) { { active: true } }
      it { is_expected.to include(aria: { current: 'page' }) }
    end

    context 'when the breadcrumb has :active set to false in options' do
      let(:options) { { active: false } }
      it { is_expected.not_to include(aria: { current: 'page' }) }
    end

    context 'when the breadcrumb does not have :active set in options' do
      let(:options) { {} }
      it { is_expected.not_to include(aria: { current: 'page' }) }
    end
  end
end
