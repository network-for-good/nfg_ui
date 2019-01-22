require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Modalable do
  let(:button) { FactoryBot.create(:bootstrap_button, **options) }
  let(:options) { {} }

  describe '#data' do
    subject { button.data }

    describe 'modal implications on the component data attribute' do
      context 'when the :remote option is true' do
        let(:options) { { remote: true, modal: '#test_modal' } }
        it 'does prevents the component from having both remote: true and the modal in options' do
          expect { subject }.to raise_error ArgumentError
        end

        context 'and when modal is empty, and remote is true' do
          let(:options) { { remote: true } }
          it 'does not raise an error' do
            expect { subject }.not_to raise_error
          end
        end
      end

      context 'when the :remote option is false' do
        context 'and when modal is empty' do
          let(:options) { {} }
          it 'does not raise an error' do
            expect { subject }.not_to raise_error
          end
        end

        context 'and when modal is present in the options' do
          let(:data_hash) { {} }
          let(:modal) { '#test_modal' }
          let(:options) { { data: data_hash, modal: modal, remote: false } }

          context 'when :modal is present in options' do
            context 'when data is already present' do
              let(:data_hash) { { test: 'value' } }
              it { is_expected.to eq(**data_hash, toggle: 'modal', target: "#{modal}") }
            end

            context 'when data is not already present' do
              it { is_expected.to eq({ toggle: 'modal', target: "#{modal}" }) }
            end
          end

          context 'when :modal is not present in options' do
            let(:options) { {} }
            it { is_expected.to eq({}) }
          end
        end
      end

      context 'when the :remote option is not present in the options' do
        let(:modal) { '#test_modal' }
        let(:options) { { modal: modal } }
        let(:rendered) { button.render }

        it 'renders the html with the modal data attributes' do
          expect(uniform_rendered_component(rendered)).to eq "<a class='btn btn-primary' data-toggle='modal' data-target='#{modal}' href='#'></a>"
        end
      end
    end
  end

  describe '#modal' do
    let(:options) { { modal: tested_modal } }
    let(:tested_modal) { nil }
    subject { button.modal }

    context 'when :modal is present & provided in the options' do
      let(:tested_modal) { '#tested_modal' }
      it { is_expected.to eq tested_modal }
    end

    context 'when :modal is nil in the options' do
      let(:tested_modal) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :modal is not present in the options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#non_html_attribute_options' do
    subject { button.send(:non_html_attribute_options) }
    it { is_expected.to include(:modal) }
  end
end
