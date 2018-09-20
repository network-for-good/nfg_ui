require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Breadcrumb do
  let(:breadcrumb) { FactoryBot.build(:bootstrap_breadcrumb) }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  
  describe '#component_family' do
    subject { breadcrumb.component_family }
    it { is_expected.to eq :breadcrumb }
  end
end
