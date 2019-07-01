require 'rails_helper'

RSpec.describe NfgUi::Components::Foundations::Illustration do
  let(:illustration) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  let(:traits) { [] }
  it { expect(described_class).to be < NfgUi::Components::Foundations::Image }

  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Sizable utility module', component_suite: :nfg
  it_behaves_like 'a component that includes the Size trait module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Illustration }

  describe '#size' do
    subject { illustration.size }
    context 'when :size is present in options' do
      let(:tested_size) { :lg }
      let(:tested_responsive) { nil }
      let(:options) { { size: tested_size, responsive: tested_responsive } }
      context 'when :responsive is true in options' do
        let(:tested_responsive) { true }

        it 'nullifies the :size value in options' do
          expect(subject).to be_nil

          and_it 'does not let size through to the html' do
            subject
            expect(illustration.render).to eq "<img class=\"img-fluid\" src=\"\" />"
          end
        end
      end

      context 'when :responsive is false in options' do
        let(:tested_responsive) { false }
        it 'accepts the size value in options (deffering to `super`)' do
          expect(illustration.options[:size]).to eq tested_size
        end
      end
    end

    context 'when :size is not present in options' do
      it 'does not apply a size to options' do
        expect(illustration.options[:size]).to be_nil
      end
    end
  end

  describe '#component_css_class' do
    subject { illustration.send(:component_css_class) }
    let(:options) { { responsive: tested_responsive } }
    context 'when :responsive is true in options' do
      let(:tested_responsive) { true }
      it { is_expected.to be_empty }
    end

    context 'when :responsive is false in options' do
      let(:tested_responsive) { false }
      it { is_expected.to eq 'illustration' }
    end
  end
end