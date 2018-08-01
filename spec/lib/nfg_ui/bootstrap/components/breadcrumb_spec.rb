require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Breadcrumb do
  let(:breadcrumb) { FactoryBot.build(:bootstrap_breadcrumb) }

  subject { described_class }

  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }

  describe '#component_family' do
    subject { breadcrumb.send(:component_family) }
    it { is_expected.to eq :breadcrumb }
  end
end
