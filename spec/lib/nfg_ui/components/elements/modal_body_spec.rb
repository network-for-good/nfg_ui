require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::ModalBody do
  let(:media_body) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::ModalBody }
  it_behaves_like 'a component with a consistent initalized construction'
end
