require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ModalBody do
  let(:modal_body) { FactoryBot.create(:bootstrap_modal_body, **options) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { modal_body.component_family }
    it { is_expected.to eq :modal }
  end
end
