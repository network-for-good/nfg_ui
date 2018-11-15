require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::Nav do
  let(:nav) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Nav }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Renderable utility module'

  it_behaves_like 'a component that includes the Pill trait module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }
end
