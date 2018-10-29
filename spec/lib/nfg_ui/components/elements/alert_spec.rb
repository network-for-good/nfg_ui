require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::Alert do
  let(:alert) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} } 
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Alert }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Theme trait module'
  it_behaves_like 'a component that includes the Dismiss trait module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }
  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Describable }
end
