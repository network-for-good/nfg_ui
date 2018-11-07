require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::Traitable do
  let(:traitable_component) { nil }
  let(:options) { {} }
  let(:traits) { [] }

  pending 'traitable spec is needed'

  describe '#component_initialize' do
    subject { traitable_component.component_initialize }
  end

  describe '#traits' do
    subject { traitable_component.traits }
  end

  describe 'private methods' do
    describe '#initialize_traits' do
      subject { traitable_component.send(:initialize_traits) }
    end
  end 
end
