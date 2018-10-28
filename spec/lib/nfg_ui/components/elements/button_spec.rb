require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::Button do
  let(:button) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Button }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Iconable utility module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }
end
