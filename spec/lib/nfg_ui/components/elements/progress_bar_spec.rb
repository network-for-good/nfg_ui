require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::ProgressBar do
  let(:progress_bar) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Progress }
  it_behaves_like 'a component with a consistent initalized construction'

  pending 'need spec updates'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }
  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Describable }
end
