require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::Table do
  let(:table) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Table }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Renderable utility module'
  it_behaves_like 'a component that includes the Size trait module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }
  it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Responsive }
  it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Table }

  describe '#caption' do
    let(:tested_option) { :caption }
    let(:default_caption) { 'fallback' }
    before { allow(table).to receive(:default_caption).and_return(default_caption) }

    subject { table.caption }

    it_behaves_like 'a fetched option with a defined fallback', fallback: 'fallback'
  end

  describe '#render' do
    subject { table.render }
    describe 'table caption' do
      let(:options) { { caption: tested_caption } }

      context 'when :caption is present in options' do
        let(:tested_caption) { 'tested caption' }
        it 'supplies a caption' do
          expect(subject).to include "<p class=\"mb-1 text-right text-muted font-size-sm\">#{tested_caption}</p>"
        end
      end

      context 'when :caption is not present in options' do
        let(:options) { {} }
        it 'does not supply a caption' do
          expect(subject).not_to include "<p class=\"mb-1 text-right text-muted font-size-sm\">"
        end
      end
    end
  end

  describe 'private methods' do
    describe '#default_caption' do
      let(:options) { { responsive: tested_responsive } }
      subject { table.send(:default_caption) }

      context 'when :responsive is true in options' do
        let(:tested_responsive) { true }
        it 'returns the default responsive caption' do
          expect(subject).to eq I18n.t('nfg_ui.components.elements.table.responsive_caption')
        end
      end

      context 'when :responsive is falsey in options' do
        let(:tested_responsive) { nil }
        it 'does not supply a fallback' do
          expect(subject).to be_blank
        end
      end
    end

    describe '#non_html_attribute_options' do
      subject { table.send(:non_html_attribute_options) }
      it { is_expected.to include :caption }
    end
  end
end
