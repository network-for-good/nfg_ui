require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::Jumbotron do
  let(:jumbotron) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Jumbotron }
  it_behaves_like 'a component with a consistent initalized construction'
end
