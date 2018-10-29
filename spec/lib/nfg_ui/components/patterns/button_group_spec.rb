require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::ButtonGroup do
  let(:button_group) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::ButtonGroup }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Size trait module'
  it_behaves_like 'a component that includes the Vertical trait module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }
  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Describable }
end
