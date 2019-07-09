require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::InputGroup do
  let(:input_group) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#render' do
    it_behaves_like 'a simple rendered component with a body'
  end
end
