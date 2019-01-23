require 'rails_helper'

# Note this is a copy of the bootstrap button. This component has enough going on
# that it needs its own complete build.  it matching very closely to
# the BS version.
# TODO: Return to this.

RSpec.describe 'nfg_ui/elements/buttons/_button.html.haml', type: :view do
  let(:button) { FactoryBot.create(:button, traits: traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  let(:tested_href) { 'test_href' }
  subject { button.render }

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

  describe 'button icons' do
    pending 'button spec needs icon'
    context 'when button has an icon in options' do
      it 'displays the icon with the button text' do
      end
    end

    context 'when button does not have an icon in option' do
      it 'displays the button text without an icon' do
      end
    end
  end

  describe 'a button with a tooltip' do
    let(:options) { { tooltip: tested_tooltip, disabled: tested_disabled, **add_on_options } }

    let(:add_on_options) { {} }
    let(:tested_tooltip) { nil }
    let(:tested_disabled) { nil }

    context 'when :tooltip is present in the options' do
      let(:tested_tooltip) { 'tested tooltip' }

      context 'when the button is not disabled' do
        let(:tested_disabled) { false }

        it 'outputs a button with a tooltip' do
          expect(subject).to have_css ".btn[data-toggle='tooltip'][title='#{tested_tooltip}']"
          expect(subject).to eq "<a class=\"btn btn-primary\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" href=\"#\" title=\"tested tooltip\"></a>"
        end

        it 'does not output disabled button tooltip html' do
          expect(subject).not_to have_css '.disabled'
          expect(subject).not_to have_css ".d-inline-block[tabindex='0'][data-toggle='tooltip'] .btn"
        end

        context 'and when a title is included in the options' do
          let(:tested_title) { 'tested title' }
          let(:add_on_options) { { title: tested_title } }

          it 'prioritizes the :tooltip value and overwrites the :title option' do
            expect(subject).to have_css "[title='#{tested_tooltip}']"
            expect(subject).not_to have_css "[title='#{tested_title}']"
            expect(subject).to eq "<a class=\"btn btn-primary\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"tested tooltip\" href=\"#\"></a>"
          end
        end

        context 'when :modal is also present in the options' do
          let(:tested_modal) { '#tested_modal' }
          let(:add_on_options) { { modal: tested_modal } }
          
          it 'raises an ArgumentError because the modal and tooltip may not coexist on a non disabled button' do
            expect { subject }.to raise_error ArgumentError
          end
        end
      end

      context 'when the button is :disabled' do
        let(:tested_disabled) { true }
        it 'outputs a disabled button wrapped in an element that contains the tooltip html' do
          expect(subject).to have_css "span.d-inline-block[data-html='true'][data-placement='top'][data-toggle='tooltip'][tabindex='0'][title='#{tested_tooltip}']"
          expect(subject).to have_css "span.d-inline-block[data-toggle='tooltip'] a.btn"
          expect(subject).to eq "<span data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"tested tooltip\" class=\"d-inline-block\" tabindex=\"0\"><a class=\"btn disabled btn-primary\" href=\"#\" tabindex=\"-1\" style=\"pointer-events: none;\"></a></span>"
        end

        context 'and when (in addition to being disabled) it has :modal set in the options' do
          let(:tested_modal) { '#tested_modal' }
          let(:add_on_options) { { modal: tested_modal } }

          it 'outputs the modal html on the button and wraps the button with the disabled tooltip wrapper html' do
            expect(subject).to have_css "[data-toggle='tooltip'][title='#{tested_tooltip}'] [data-toggle='modal'][data-target='#{tested_modal}']"
            expect(subject).to eq "<span data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"tested tooltip\" class=\"d-inline-block\" tabindex=\"0\"><a class=\"btn disabled btn-primary\" data-toggle=\"modal\" data-target=\"#{tested_modal}\" href=\"#\" tabindex=\"-1\" style=\"pointer-events: none;\"></a></span>"
          end
        end
      end
    end

    context 'when :tooltip is set to nil in the options' do
      let(:tested_tooltip) { nil }
      it { is_expected.not_to have_css "[data-toggle='tooltip']" }
    end

    context 'when :tooltip is not present in the options' do
      let(:options) { {} }
      it { is_expected.not_to have_css "[data-toggle='tooltip']" }
    end
  end

  describe 'a button set as a collapse toggle' do
    context 'when a button has :collapse in the options hash' do
      let(:options) { { collapse: tested_collapse, as: tested_as } }
      let(:tested_collapse) { '#tested_collapse_id' }
      let(:tested_as) { :button }

      it { is_expected.to include "data-toggle=\"collapse\"" }

      it 'removes the hash symbol from the collapse option for the aria-controls attribute' do
        expect(subject).to include 'aria-controls="tested_collapse_id"'
        expect(subject).not_to include 'aria-controls="#tested_collapse_id"'
      end

      context 'and when a button component is :button element' do
        let(:tested_as) { :button }
        it 'uses a data-target attribute to identify its collapse target' do
          expect(subject).to include "data-target=\"#{tested_collapse}\""
        end

        it 'does not have an href for targeting the collapsible element' do
          expect(subject).not_to include "href=\"#{tested_collapse}\""
        end

        it { is_expected.to eq "<button class=\"btn btn-primary\" data-toggle=\"collapse\" data-target=\"#{tested_collapse}\" aria-expanded=\"false\" aria-controls=\"#{tested_collapse.gsub('#', '')}\" role=\"button\" type=\"button\"></button>" }
      end

      context 'and when a button component is an :a element' do
        let(:tested_as) { :a }
        it 'uses the link href to identify its collapse target' do
          expect(subject).to include "href=\"#{tested_collapse}\""
        end

        it 'does not use a data-target attribute to identify its collapse target' do
          expect(subject).not_to include "data-target=\"#{tested_collapse}\""
        end
        it { is_expected.to eq "<a class=\"btn btn-primary\" data-toggle=\"collapse\" href=\"#{tested_collapse}\" aria-expanded=\"false\" aria-controls=\"#{tested_collapse.tr('#', '')}\" role=\"button\"></a>" }

      end
    end

    context 'when a button does not have :collapse in the options hash' do
      it { is_expected.not_to include "data-toggle=\"collapse\"" }
    end
  end

  describe 'button sizes' do
    let(:options) { { size: tested_size } }
    context 'when size is :sm' do
      let(:tested_size) { :sm }
      it 'outputs a small button' do
        expect(subject).to have_css '.btn-sm'
        expect(subject).to eq "<a class=\"btn btn-sm btn-primary\" href=\"#\"></a>"
      end
    end

    context 'when size is :lg' do
      let(:tested_size) { :lg }
      it 'outputs a large button' do
        expect(subject).to have_css '.btn-lg'
        expect(subject).to eq "<a class=\"btn btn-lg btn-primary\" href=\"#\"></a>"
      end
    end

    context 'when size is an invalid value' do
      let(:tested_size) { :not_sm_or_lg }
      it 'does not output a resized button' do
        expect(subject).not_to have_css ".btn-#{tested_size}"
        expect(subject).to eq "<a class=\"btn btn-primary\" href=\"#\"></a>"
      end
    end

    context 'when size is not present in the options' do
      let(:options) { {} }
      it 'does not output a resized button' do
        expect(subject).to eq "<a class=\"btn btn-primary\" href=\"#\"></a>"
      end
    end
  end
end
