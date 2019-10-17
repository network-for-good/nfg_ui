require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Modal do
  let(:modal) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { { body: body, footer: footer_text } }
  let(:body) { 'test body' }
  let(:footer_text) { nil }
  let(:rendered) { modal.render }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#render' do
    subject { Capybara.string(rendered) }

    context 'when render_in_body is true' do
      let(:options) { { render_in_body: true, body: body } }
      it 'renders the body content within .modal-body' do
        expect(subject).to have_selector '.modal-body', text: body
      end
    end

    context 'when render_in_body is false' do
      let(:options) { { render_in_body: false, body: body } }
      it 'renders the body content within .modal' do
        by 'not rendering .modal-body' do
          expect(subject).not_to have_css '.modal-body'
        end

        and_by 'rendering the body content directly within .modal-content' do
          expect(subject).to have_selector '.modal-content', text: body
        end
      end
    end

    context 'when render_in_body is not present' do
      let(:options) { { body: body } }
      it 'renders the body content within .modal-body' do
        expect(subject).to have_selector '.modal-body', text: body
      end
    end
  end

  describe '#component_family' do
    subject { modal.component_family }
    it { is_expected.to eq :modal }
  end

  describe '#title' do
    subject { modal.title }
    let(:tested_title) { 'tested title' }
    context 'when title is present in options' do
      let(:options) { { title: tested_title } }
      it { is_expected.to eq tested_title }
    end

    context 'when title is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#footer' do
    subject { modal.footer }
    context 'when footer is present' do
      let(:footer_text) { 'test footer' }
      it { is_expected.to eq footer_text }
    end

    context 'when footer is not present' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end

    context 'when footer is nil' do
      let(:options) { { footer: nil } }
      it { is_expected.to be_nil }
    end
  end

  describe '#render_in_body' do
    subject { modal.render_in_body }

    context 'when render_in_body is true' do
      let(:options) { { render_in_body: true } }
      it { is_expected.to be }
    end

    context 'when render_in_body is false' do
      let(:options) { { render_in_body: false } }
      it { is_expected.not_to be }
    end

    context 'when render_in_body is nil' do
      let(:options) { { render_in_body: nil } }
      it { is_expected.to be_nil }
    end

    context 'when render_in_body is not present in options' do
      let(:options) { {} }
      it { is_expected.to be }
    end
  end

  describe '#css_classes' do
    subject { modal.send(:css_classes) }
    it { is_expected.to eq 'modal fade' }
  end

  describe '#size' do
    let(:tested_option) { :size }
    subject { modal.size }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#non_html_attribute_options' do
    subject { modal.send(:non_html_attribute_options) }
    context 'when footer is present' do
      let(:footer_text) { 'test footer' }
      it { is_expected.to include :footer }
    end

    context 'when footer is nil' do
      let(:footer_text) { nil }
      it { is_expected.not_to include :footer }
    end

    context 'when footer is not present' do
      let(:options) { {} }
      it { is_expected.not_to include :footer }
    end

    context 'when title is present' do
      let(:title) { 'test_title' }
      let(:options) { { title: title } }
      it { is_expected.to include :title }

    end

    context 'when title is not present' do
      it { is_expected.not_to include :title }
    end
  end

  describe '#modal_dialog_css_classes' do
    subject { modal.send(:modal_dialog_css_classes) }

    context 'when modal is resized?' do
      let(:options) { { size: :lg } }
      it 'adds the size css class' do
        expect(subject).to eq 'modal-dialog modal-lg'
      end
    end

    context 'when modal is not resized?' do
      let(:options) { {} }
      it 'does not add the size css class' do
        expect(subject).to eq 'modal-dialog'
      end
    end
  end

  describe '#resized?' do
    let(:options) { { size: size } }
    let(:size) { nil }
    subject { modal.send(:resized?) }

    context 'when the size is a legal size' do
      let(:size) { :sm }
      it { is_expected.to be }
    end

    context 'when the size is not a legal size' do
      let(:size) { :arbitrary }
      it { is_expected.not_to be }
    end
  end

  describe '#assistive_html_attributes' do
    subject { modal.send(:assistive_html_attributes) }
    it { is_expected.to include(role: 'dialog', tabindex: '-1', aria: { hidden: 'true' }) }
  end
end
