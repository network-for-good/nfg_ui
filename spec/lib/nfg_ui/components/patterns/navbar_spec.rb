require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::Navbar do
  let(:navbar) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Navbar }
  it_behaves_like 'a component with a consistent initalized construction'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }
  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Describable }
end
