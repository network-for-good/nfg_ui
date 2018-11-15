require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Progress do
  let(:progress) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  it_behaves_like 'a component with a consistent initalized construction'

  pending 'Specs needed'
end
