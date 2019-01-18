require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Modalable do
  let(:button) { FactoryBot.create(:button, **options) }
  let(:options) { {} }

  describe '#data' do
    subject { button.data }

    describe 'modal implications on the component data attribute' do
      # Describing when a link / button is set to remote: true for ajax
      context 'when the :remote option is true' do
        let(:rendered) { button.render }
        let(:target_modal) { '#test_modal' }

        # test against the rendered component
        # which is where the data attribute output is completely implemented
        subject { Capybara.string(rendered) }

        let(:options) { { remote: true, modal: target_modal, **data_attributes } }
        let(:data_attributes) { {} }

        context 'and when the button also includes custom data attributes' do
          let(:test_key) { :testkey }
          let(:test_value) { 'test-value' }
          let(:data_attributes) { { data: { test_key => test_value } } }

          it 'does not add the modal attributes to the component' do
            # raise rendered.inspect
            by 'not removing the remote true data attribute' do
              expect(subject).to have_css "[data-remote='true']"
            end

            and_it 'does not remove the custom data attributes from the component' do
              expect(subject).to have_css "[data-#{test_key}='#{test_value}']"
            end

            and_it 'does not add the modal data attributes' do
              expect(subject).not_to have_css "[data-toggle='modal']" # sanity check
              expect(subject).not_to have_css "[data-toggle='modal'][data-target='#{target_modal}']"
            end

            and_it 'outputs the html exactly as expected' do
              # Test against the rendered component's HTML, not the capybara object.
              expect(uniform_rendered_component(rendered)).to eq "<a class='btn btn-primary' data-testkey='test-value' data-remote='true' href='#'></a>"
            end
          end
        end

        context 'and when the button does not include custom data attributes' do
          let(:data_attributes) { {} }
          it 'does not add the modal data attributes' do
            expect(subject).not_to have_css "[data-toggle='modal']" # sanity check
            expect(subject).not_to have_css "[data-toggle='modal'][data-target='#{target_modal}']"

            and_it 'does not remove the data attributes supplied by remote: true' do
              expect(subject).to have_css "[data-remote='true']" # sanity check
            end

            and_it 'outputs the html exactly as expected' do
              # Test against the rendered component's HTML, not the capybara object.
              expect(uniform_rendered_component(rendered)).to eq "<a class='btn btn-primary' data-remote='true' href='#'></a>"
            end
          end
        end
      end

      context 'when the :remote option is false' do
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
