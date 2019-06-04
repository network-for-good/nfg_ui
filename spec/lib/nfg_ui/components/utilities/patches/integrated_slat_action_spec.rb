require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::Patches::IntegratedSlatAction do
  # This utility is consumed by SlatAction
  let(:options) { {} }
  let(:view_context) { ActionController::Base.new.view_context }
  let(:slat_actions) { NfgUi::Components::Patterns::SlatActions.new(options, view_context) }

  # Have to run these against SlatActions since it's included in the SlatActions class
  describe 'included modules' do
    let(:described_class) { NfgUi::Components::Patterns::SlatActions }
    it_behaves_like 'a component that includes the Iconable utility module'
  end

  describe '#button' do
    let(:tested_button) { nil }
    let(:options) { { button: tested_button } }
    subject { slat_actions.button }

    context 'when button is present in options' do
      let(:tested_button) { true }
      it { is_expected.to be }
    end

    context 'when button is not present in options' do
      let(:options) { {} }
      it { is_expected.to be false }
    end
  end

  describe '#confirm' do
    let(:tested_confirm) { nil }
    let(:options) { { confirm: tested_confirm } }
    subject { slat_actions.confirm }

    context 'when confirm is present in options' do
      let(:tested_confirm) { true }
      it { is_expected.to be }
    end

    context 'when confirm is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#disable_with' do
    let(:tested_disable_with) { nil }
    let(:options) { { disable_with: tested_disable_with } }
    subject { slat_actions.disable_with }

    context 'when disable_with is present in options' do
      let(:tested_disable_with) { 'test' }
      it { is_expected.to eq tested_disable_with }
    end

    context 'when disable_with is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#href' do
    let(:tested_href) { nil }
    let(:options) { { href: tested_href } }
    subject { slat_actions.href }

    context 'when href is present in options' do
      let(:tested_href) { '#test' }
      it { is_expected.to eq tested_href }
    end

    context 'when href is not present in options' do
      let(:options) { {} }
      it { is_expected.to eq '#' }
    end

    context 'when href is nil in options' do
      let(:tested_href) { nil }
      it { is_expected.to eq '#' }
    end
  end

  describe '#method' do
    let(:tested_method) { nil }
    let(:options) { { method: tested_method } }
    subject { slat_actions.send(:method) }

    context 'when method is present in options' do
      let(:tested_method) { :patch }
      it { is_expected.to eq tested_method }
    end

    context 'when method is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#outlined' do
    subject { slat_actions.outlined }
    let(:options) { {} }

    context 'when :outlined is present in options' do
      let(:tested_outline) { true }
      let(:options) { { outlined: tested_outline } }
      it { is_expected.to eq tested_outline }
    end

    context 'when :outlined is not present in options' do
      context 'and when :button is present in options' do
        let(:options) { { button: tested_button } }
        let(:tested_button) { true }
        it { is_expected.to eq tested_button }
      end

      context 'and when :button is not present in options' do
        let(:options) { {} }
        it { is_expected.not_to be }
      end

    end

  end

  describe '#remote' do
    let(:tested_remote) { nil }
    let(:options) { { remote: tested_remote } }
    subject { slat_actions.remote }

    context 'when remote is present in options' do
      let(:tested_remote) { true }
      it { is_expected.to be }
    end

    context 'when remote is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_falsey }
    end
  end

  describe '#render_integrated_slat_action' do
    let(:options) { { button: tested_button } }
    subject { slat_actions.render_integrated_slat_action }

    context 'when :button is true in options' do
      let(:tested_button) { true }
      it 'renders a button component' do
        expect(subject).to eq "<a class=\"btn btn-outline-secondary\" href=\"#\"></a>"
      end
    end

    context 'when :button is falsey' do
      let(:tested_button) { false }
      it 'renders a link' do
        expect(subject).to eq "<a href=\"#\" class=\"d-block\"></a>"
      end
    end
  end

  describe '#theme' do
    let(:tested_theme) { nil }
    let(:options) { { theme: tested_theme } }
    subject { slat_actions.theme }

    context 'when theme is present in options' do
      let(:tested_theme) { :danger }
      it { is_expected.to eq tested_theme }
    end

    context 'when theme is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe 'private methods' do
    describe '#integrated_slat_action_link_css_classes' do
      subject { slat_actions.send(:integrated_slat_action_link_css_classes) }

      it { is_expected.to include 'd-block' }

      context 'when theme is present' do
        let(:options) { { theme: tested_theme } }
        let(:tested_theme) { :danger }
        it { is_expected.to eq "text-#{tested_theme.to_s} d-block" }
      end

      context 'when theme is not present' do
        let(:options) { {} }
        it { is_expected.not_to include "text" }
        it { is_expected.to eq 'd-block' }
      end
    end

    describe '#delete_link?' do
      subject { slat_actions.send(:delete_link?) }

      context 'when :method is present in options' do
        let(:options) { { method: tested_method } }

        context 'when :method is :delete' do
          let(:tested_method) { :delete }
          it { is_expected.to be }
        end

        context 'when :method is not :delete' do
          let(:tested_method) { :patch }
          it { is_expected.not_to be }
        end
      end

      context 'when :method is not present in options' do
        let(:options) { {} }
        it { is_expected.to be_falsey }
      end
    end

    describe '#integrated_slat_action_html_data_attributes' do
      let(:options) { { method: tested_method, disable_with: tested_disable_with, confirm: tested_confirm } }
      let(:tested_method) { nil }
      let(:tested_disable_with) { nil }
      let(:tested_confirm) { nil }

      subject { slat_actions.send(:integrated_slat_action_html_data_attributes) }

      context 'when the the options include method: :delete' do
        let(:tested_method) { :delete }
        it { is_expected.to include({ method: :delete }) }
        it { expect(subject.keys).to include :method }
      end

      context 'when the options do not include method: :delete' do
        let(:tested_method) { :patch }
        it { expect(subject.keys).not_to include :method }
      end
    end

    describe '#render_button' do
      subject { slat_actions.send(:render_button) }
      it { is_expected.to eq "<a class=\"btn btn-secondary\" href=\"#\"></a>" }
    end

    describe '#render_link' do
      subject { slat_actions.send(:render_link) }
      it { is_expected.to eq "<a href=\"#\" class=\"d-block\"></a>" }
    end
  end
end
