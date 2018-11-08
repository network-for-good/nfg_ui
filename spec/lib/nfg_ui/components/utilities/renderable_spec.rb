require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::Describable do
  let(:tested_component) { FactoryBot.create(:alert, **options) }
  let(:options) { {} }

  describe '#render_if' do
    subject { tested_component.render_if }

    let(:options) { { render_if: tested_render_if } }
    let(:tested_render_if) { nil }

    context 'when render_if is true' do
      let(:tested_render_if) { true }
      it { is_expected.to be }
    end

    context 'when render_if is false' do
      let(:tested_render_if) { false }
      it { is_expected.not_to be }
    end

    context 'when render_if is nil' do
      let(:tested_render_if) { nil }
      it { is_expected.to be_nil }
    end

    context 'when render_if is not present' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#render_unless' do
    subject { tested_component.render_unless }
    let(:options) { { render_unless: tested_render_unless } }

    context 'when render_unless is true' do
      let(:tested_render_unless) { true }
      it { expect(subject).to be }
    end

    context 'when render_unless is false' do
      let(:tested_render_unless) { false }
      it { is_expected.not_to be }
    end

    context 'when render_unless is nil' do
      let(:tested_render_unless) { nil }
      it { is_expected.to be_nil }
    end

    context 'when render_unless is not present' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe 'private methods' do
    describe '#non_html_attribute_options' do
      subject { tested_component.send(:non_html_attribute_options) }
      it { is_expected.to include(:render_if, :render_unless) }
    end
  end
end
