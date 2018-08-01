require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::BreadcrumbItem do
  let(:breadcrumb_item) { FactoryBot.build(:bootstrap_breadcrumb_item) }

  subject { described_class }

  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }

  describe '#component_family' do
    subject { breadcrumb_item.send(:component_family) }
    it { is_expected.to eq :breadcrumb }
  end
end
