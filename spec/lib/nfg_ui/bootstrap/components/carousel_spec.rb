require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Carousel do
  let(:carousel) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
end
