require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Collapse do
  let(:collapse) { FactoryBot.create(:bootstrap_collapse, **options) }
  let(:options) { { id: test_id } }
  let(:test_id) { 'test_id' }
  subject { described_class }
  
  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction', required_options: { id: 'test_id' }
  # it_behaves_like 'a component that includes the Collapsible utility module'

  describe '#id' do
    let(:view_context) { ActionController::Base.new.view_context }
    let(:collapse) { NfgUi::Bootstrap::Components::Collapse.new(options, view_context) }
    let(:options) { {} }
    subject { collapse.id }

    context 'when collapse id is present' do
      let(:options) { { id: test_id } }
      it { expect { subject }.not_to raise_error }
      it { is_expected.to eq test_id }
    end

    context 'when collapse id is not present' do
      let(:options) { {} }
      it { expect { subject }.to raise_error(ArgumentError) }
    end
  end
end
