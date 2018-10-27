require 'rails_helper'

RSpec.describe NfgUi::Components::Traits::Collapse do
  let(:component_with_traits) { nil }
  let(:options) { {} }
  let(:traits) { [] }

  pending 'trait spec is needed'

  describe '#collapsible' do
    subject { component_with_traits.send(:collapsible) }
  end

  describe '#collapsed' do
    subject { component_with_traits.send(:collapsed) }
  end
end
