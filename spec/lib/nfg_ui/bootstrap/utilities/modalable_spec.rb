require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Modalable do
  let(:button) { FactoryBot.create(:bootstrap_button, **options) }
  let(:options) { {} }

  describe '#data' do
    subject { button.data }

    describe 'modal implications on the component data attribute' do
      context 'when the :remote option is true' do
        let(:options) { { remote: true, modal: '#test_modal' } }
        it 'raises an error, preventing the component from having both remote: true and the modal in options' do
          expect { subject }.to raise_error ArgumentError
        end

        context 'and when modal is empty, and remote is true' do
          let(:options) { { remote: true } }
          it 'does not raise an error' do
            expect { subject }.not_to raise_error
          end
        end
      end

      context 'and when tooltip is present in options' do
        let(:options) { { tooltip: 'test tooltip', modal: '#test_modal' } }
        it 'raises an error, preventing the component from having both :tooltip and the modal in options' do
          expect { subject }.to raise_error ArgumentError
        end

        context 'and when modal is empty, and tooltip is present' do
          let(:options) { { tooltip: 'test tooltip' } }
          it 'does not raise an error' do
            expect { subject }.not_to raise_error
          end
        end
      end

      context 'when the :remote option is falsy' do
        context 'and when modal is empty' do
          let(:options) { { remote: false, modal: nil } }
          it 'does not raise an error' do
            expect { subject }.not_to raise_error
          end
        end

        context 'and when modal is present in the options' do
          let(:data_hash) { {} }
          let(:modal) { '#test_modal' }
          let(:options) { { data: data_hash, modal: modal, remote: false } }

          context 'when :modal is present in options' do
            context 'and when tooltip is present' do
              let(:options) { { data: data_hash, modal: modal, remote: false, tooltip: 'test tooltip' } }
              it { expect { subject }.to raise_error ArgumentError }
            end

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

  describe '#error_message_i18n_path' do
    let(:remote) { nil }
    let(:tooltip) { nil }
    let(:options) { { remote: remote, tooltip: tooltip } }

    subject { button.send(:error_message_i18n_path) }

    context 'when remote is true in the component options' do
      let(:remote) { true }
      context 'and when tooltip is present in options' do
        let(:tooltip) { 'Test Tooltip' }
        it "checks remote first and returns the 'remote' string" do
          expect(subject).to eq 'remote'
        end
      end

      context 'and when tooltip is not present in options' do
        let(:tooltip) { nil }
        it 'returns the correct string' do
          expect(subject).to eq 'remote'
        end
      end
    end

    context 'when tooltip is present in component options' do
      let(:tooltip) { 'Tested tooltip' }
      context 'when remote is present in the options' do
        let(:remote) { true }
        it 'matches up with remote first, returning the remote string' do
          expect(subject).to eq 'remote'
        end
      end

      context 'when remote is not present in the options' do
        let(:remote) { nil }
        it 'returns the tooltip string' do
          expect(subject).to eq 'tooltip'
        end
      end
    end
  end

  describe '#component_includes_problematic_options_for_modal?' do
    let(:remote) { nil }
    let(:disabled) { nil }
    let(:tooltip) { nil }
    let(:modal) { nil }
    let(:options) { { modal: modal, remote: remote, disabled: disabled, tooltip: tooltip } }

    subject { button.send(:component_includes_problematic_options_for_modal?) }

    context 'when modal is present in the options' do
      let(:modal) { '#test_modal' }

      context 'and when remote is true in the options' do
        let(:remote) { true }
        it { is_expected.to be }
      end

      context 'and when remote is falsy in options' do
        let(:remote) { nil }
        it { is_expected.not_to be }
      end

      context 'when a tooltip is present' do
        let(:tooltip) { 'Test tooltip' }

        context 'and when the component is disabled' do
          let(:disabled) { true }
          # a disabled component may have both a modal and tooltip in its options
          # this is due to how disabled components are rendered
          # with a wrapping html element -- the tooltip is applied to the wrapping
          # element and not the modalable component.
          it { is_expected.not_to be }
        end

        context 'and when the component is not disabled' do
          let(:disabled) { nil }
          it { is_expected.to be }
        end
      end
    end

    context 'when modal is not present in the options' do
      let(:modal) { nil }
      it { is_expected.not_to be }
    end
  end

  describe '#illegal_tooltip?' do
    let(:options) { { disabled: disabled, tooltip: tooltip } }
    let(:disabled) { nil }
    let(:tooltip) { nil }

    subject { button.send(:illegal_tooltip?) }
    
    context 'when a tooltip is present in options' do
      let(:tooltip) { 'test tooltip' }

      context 'and when component is not disabled (disabled is false)' do
        let(:disabled) { false }
        it 'is an illegal tooltip' do
          expect(subject).to be
        end
      end

      context 'when component is disabled' do
        let(:disabled) { true }
        it 'is not an illegal tooltip' do
          expect(subject).not_to be
        end
      end
    end

    context 'and when a tooltip is not present in options' do
      let(:tooltip) { nil }
      it 'is not an illegal tooltip (because no tooltip is present)' do
        expect(subject).not_to be
      end
    end
  end

  describe '#non_html_attribute_options' do
    subject { button.send(:non_html_attribute_options) }
    it { is_expected.to include(:modal) }
  end
end
