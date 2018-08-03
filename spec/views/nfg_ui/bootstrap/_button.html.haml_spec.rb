require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_button.html.haml', type: :view do
  let(:button) { FactoryBot.create(:bootstrap_button, **options) }
  let(:options) { {} }
  let(:tested_href) { 'test_href' }
  subject { render 'nfg_ui/bootstrap/button', button: button }

  describe 'a disabled button' do
    let(:options) { { disabled: true, as: option_as } }
    let(:option_as) { nil }
    context 'when the button is :as an :a tag' do
      let(:option_as) { :a }
      it { is_expected.to have_css 'a.disabled' }
      it { is_expected.not_to have_css 'a[disabled]' }
    end

    context 'when the button is :as a :button tag' do
      let(:option_as) { :button }
      it { is_expected.not_to have_css 'button.disabled' }
      it { is_expected.to have_css 'button[disabled]' }
    end
  end

  describe 'a button with a tooltip' do
    let(:options) { { tooltip: tested_tooltip, disabled: tested_disabled } }
    let(:tested_tooltip) { nil }
    let(:tested_disabled) { nil }
    context 'when :tooltip is present in the options' do
      let(:tested_tooltip) { 'tested tooltip' }

      context 'when the button is not disabled' do
        let(:tested_disabled) { false }
        it 'outputs a button with a tooltip' do
          expect(subject).to have_css ".btn[data-toggle='tooltip'][title='#{tested_tooltip}']"
          expect(subject).to eq "<a class=\"btn btn-primary\" title=\"tested tooltip\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\">\n</a>"
        end

        it 'does not output disabled button tooltip html' do
          expect(subject).not_to have_css '.disabled'
          expect(subject).not_to have_css ".d-inline-block[tabindex='0'][data-toggle='tooltip'] .btn"
        end
      end

      context 'when the button is disabled' do
        let(:tested_disabled) { true }
        it 'outputs a disabled button wrapped in an element that contains the tooltip html' do
          # raise subject.inspect
        end
      end
    end

    context 'when :tooltip is set to nil in the options' do

    end

    context 'when :tooltip is not present in the options' do

    end

    context 'when :tooltip is present and :modal is present in the options' do

    end
  end

end
