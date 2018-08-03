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
          expect(subject).to eq "<a class=\"btn btn-primary\" title=\"tested tooltip\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\">\n</a>"
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
            expect(subject).to eq  "<a class=\"btn btn-primary\" title=\"tested tooltip\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\">\n</a>"
          end
        end

        context 'when :modal is also present in the options' do
          let(:tested_modal) { '#tested_modal' }
          let(:add_on_options) { { modal: tested_modal } }
          # it { raise options[:modal].present?.inspect }
          it 'prioritizes :modal html over :tooltip html which excludes the tooltip html' do
            expect(subject).not_to have_css ".btn[data-toggle='tooltip']"
            expect(subject).to eq "<a class=\"btn btn-primary\" data-toggle=\"modal\" data-target=\"#{tested_modal}\">\n</a>"
            # raise subject.inspect
          end

          describe 'the title html attribute output' do
            context 'and when a title is not present in options' do
              # let(:add_on_options) { {} }
              
              it 'does not add the :title html attribute with the tooltip text to the component html' do
                # raise subject.inspect
                expect(subject).not_to have_css ".btn[title='#{tested_tooltip}']"
              end
            end

            context 'and when a title is present in the options' do
              let(:tested_title) { 'tested title' }
              before { add_on_options.merge!(title: tested_title) }

              it 'ignores the tooltip value and adds the options[:title] as an html attribute' do
                # raise subject.inspect
                expect(subject).to have_css "[title='#{tested_title}']"
                expect(subject).not_to have_css "[title='#{tested_tooltip}']"
              end
            end
          end

          context 'and when an arbitrary data attribute and data key are present' do
            let(:add_on_options) { { modal: tested_modal, data: tested_data } }
            let(:tested_data) { { test_key: :data_test_value } }
            # , data: { tested_key: :tested_value }
            # it { raise subject.inspect }
            it { is_expected.to have_css "[data-test-key='data_test_value'][data-toggle='modal'][data-target='#{tested_modal}']" }

            context 'and when there is another manually set data toggle within the options hash' do
              before { tested_data.merge!(toggle: 'a-plugin') }
              it 'prioritizes :modal over both data toggles' do
                expect(subject).not_to have_css "[data-toggle='a-plugin']"
                expect(subject).to have_css "[data-toggle='modal']"
                expect(subject).to eq "<a class=\"btn btn-primary\" data-test-key=\"data_test_value\" data-toggle=\"modal\" data-target=\"#{tested_modal}\">\n</a>"
              end
            end
          end
        end
      end

      context 'when the button is :disabled' do
        let(:tested_disabled) { true }
        it 'outputs a disabled button wrapped in an element that contains the tooltip html' do
          expect(subject).to have_css "span.d-inline-block[data-html='true'][data-placement='top'][data-toggle='tooltip'][tabindex='0'][title='#{tested_tooltip}']"
          expect(subject).to have_css "span.d-inline-block[data-toggle='tooltip'] a.btn"
          expect(subject).to eq "<span class='d-inline-block' data-html='true' data-placement='top' data-toggle='tooltip' tabindex='0' title='tested tooltip'>\n<a class=\"btn btn-primary disabled\" style=\"pointer-events: none;\">\n</a></span>\n"
        end

        context 'and when (in addition to being disabled) it has :modal set in the options' do
          let(:tested_modal) { '#tested_modal' }
          let(:add_on_options) { { modal: tested_modal } }
          it 'outputs the modal html on the button and wraps the button with the disabled tooltip wrapper html' do
            expect(subject).to have_css "[data-toggle='tooltip'][title='#{tested_tooltip}'] [data-toggle='modal'][data-target='#{tested_modal}']"
            expect(subject).to eq "<span class='d-inline-block' data-html='true' data-placement='top' data-toggle='tooltip' tabindex='0' title='tested tooltip'>\n<a class=\"btn btn-primary disabled\" tabindex=\"-1\" data-toggle=\"modal\" data-target=\"#tested_modal\">\n</a></span>\n"
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
end
