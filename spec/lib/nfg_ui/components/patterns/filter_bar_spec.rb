require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::FilterBar do
  let(:filter_bar) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
end
