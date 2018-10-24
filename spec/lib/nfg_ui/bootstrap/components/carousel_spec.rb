require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Carousel do
  let(:carousel) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_family' do
    subject { carousel.component_family }
    it { is_expected.to eq :carousel }
  end

  describe '#data' do
    subject { carousel.data }
    context 'when data attributes are currently present' do
      let(:tested_data) { { tested: 'data' } }
      let(:options) { { data: tested_data } }
      it { is_expected.to eq(**tested_data, ride: 'carousel') }
    end

    context 'when data attributes are not present' do
      let(:options) { {} }
      it { is_expected.to eq(ride: 'carousel') }
    end
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { carousel.send(:css_classes) }
      it { is_expected.to eq 'carousel slide' }
    end
  end
end
