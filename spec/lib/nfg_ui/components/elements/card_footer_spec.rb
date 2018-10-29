require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::CardFooter do
  let(:card_footer) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} } 
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::CardFooter }
  it_behaves_like 'a component with a consistent initalized construction'

  pending 'Needs spec updates'
end
