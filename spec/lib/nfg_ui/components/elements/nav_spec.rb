require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::Nav do
  let(:nav) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Nav }
  it_behaves_like 'a component with a consistent initalized construction'
end
