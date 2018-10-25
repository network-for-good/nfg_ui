require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Pagination do
  let(:pagination) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Alignable utility module'
  it_behaves_like 'a component that includes the Sizable utility module'

  describe '#component_family' do
    subject { pagination.component_family }
    it { is_expected.to eq :pagination }
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { nav.send(:css_classes) }
    end
  end
end
