require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Button do
  let(:button) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Activatable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the CollapseToggleable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Disableable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Remotable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Sizable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Themeable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Tooltipable utility module'
  it_behaves_like 'a component that includes the Wrappable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Modalable utility module', component_suite: :bootstrap

  describe '#block' do
    subject { button.block }
    let(:options) { { block: tested_block } }
    let(:tested_block) { nil }

    context 'when :block is set as true in options' do
      let(:tested_block) { true }
      it { is_expected.to be }
    end

    context 'when :block is set as false in options' do
      let(:tested_block) { false }
      it { is_expected.to be false }
    end

    context 'when :block is set as nil in options' do
      let(:tested_block) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :block is not present in options' do
      let(:options) { {} }
      it { is_expected.to be false }
    end
  end

  describe '#href' do
    subject { button.href }
    context 'when :as is :button' do
      let(:options) { { as: :button } }
      it { is_expected.to be_nil }
    end

    context 'when :as is not button' do
      let(:options) { {} }
      let(:tested_collapse) { '#tested_collapse' }
      let(:tested_modal) { '#tested_modal' }
      let(:tested_href) { '#tested-href' }

      context 'href with collapse' do
        let(:options) { { collapse: tested_collapse } }
        context 'when collapse is truthy' do
          it { is_expected.to eq tested_collapse }
        end

        context 'when collapse is falsey' do
          let(:options) { { collapse: false } }
          it { is_expected.to eq '#' }
        end

        context 'when collapse is nil' do
          let(:options) { { collapse: nil } }
          it { is_expected.to eq '#' }
        end

        context 'when href is present' do

          let(:options) { { collapse: nil, href: tested_href } }
          it { is_expected.to eq tested_href }
          it { is_expected.not_to eq '#' }
        end

        context 'when collapse and href are present' do
          let(:options) { { href: tested_href, collapse: tested_collapse } }
          it { is_expected.to eq tested_collapse }
        end
      end
    end
  end

  describe '#remove_component_css_classes' do
    subject { button.remove_component_css_classes }
    let(:options) { { remove_component_css_classes: tested_remove_component_css_classes } }
    let(:tested_remove_component_css_classes) { nil }

    context 'when :block is set as true in options' do
      let(:tested_remove_component_css_classes) { true }
      it { is_expected.to be }
    end

    context 'when :block is set as false in options' do
      let(:tested_remove_component_css_classes) { false }
      it { is_expected.to be false }
    end

    context 'when :block is set as nil in options' do
      let(:tested_remove_component_css_classes) { nil }
      it { is_expected.to be_nil }
    end

    context 'when :block is not present in options' do
      let(:options) { {} }
      it { is_expected.to be false }
    end
  end

  describe '#render' do
    let(:rendered_html) { button.render }
    let(:tested_href) { 'test_href' }
    subject { Capybara.string(rendered_html) }

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
            expect(rendered_html).to eq "<a class=\"btn btn-primary\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" href=\"#\" title=\"#{tested_tooltip}\"></a>"
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
              expect(rendered_html).to eq "<a class=\"btn btn-primary\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\" href=\"#\"></a>"
            end
          end

          context 'when :modal is also present in the options' do
            let(:tested_modal) { '#tested_modal' }
            let(:add_on_options) { { modal: tested_modal } }
            it 'raises an argument error because a tooltip and modal may not both be present in options' do
              expect { subject }.to raise_error ArgumentError
            end
          end
        end

        context 'when the button is :disabled' do
          let(:tested_disabled) { true }
          it 'outputs a disabled button wrapped in an element that contains the tooltip html' do
            expect(subject).to have_css "span.d-inline-block[data-html='true'][data-placement='top'][data-toggle='tooltip'][tabindex='0'][title='#{tested_tooltip}']"
            expect(subject).to have_css "span.d-inline-block[data-toggle='tooltip'] a.btn"
            expect(rendered_html).to eq "<span data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\" class=\"d-inline-block\" tabindex=\"0\"><a class=\"btn disabled btn-primary\" href=\"#\" tabindex=\"-1\" style=\"pointer-events: none;\"></a></span>"
          end

          context 'and when (in addition to being disabled) it has :modal set in the options' do
            let(:tested_modal) { '#tested_modal' }
            let(:add_on_options) { { modal: tested_modal } }

            it 'outputs the modal html on the button and wraps the button with the disabled tooltip wrapper html' do
              expect(subject).to have_css "[data-toggle='tooltip'][title='#{tested_tooltip}'] [data-toggle='modal'][data-target='#{tested_modal}']"
              expect(rendered_html).to eq "<span data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\" class=\"d-inline-block\" tabindex=\"0\"><a class=\"btn disabled btn-primary\" data-toggle=\"modal\" data-target=\"#{tested_modal}\" href=\"#\" tabindex=\"-1\" style=\"pointer-events: none;\"></a></span>"
            end

            describe 'error-free rendering of a disabled button with a :modal & :tooltip' do
              # Setting options manually to ensure the scenario unfolds exactly as described
              let(:options) { { disabled: true, modal: '#test_modal', tooltip: 'test tooltip' } }

              # the modal'd button is wrapped in a disabled component html wrapper
              # where the tooltip is subsequently applied -- and not on the button.
              # thus, the data-toggles do not compete and there is no issue of an ArgumentError
              it 'does not raise an argument error because the component is allowed to be disabled, include a modal AND and a tooltip' do
                expect { button.render }.not_to raise_error
              end
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

        it { expect(rendered_html).to include "data-toggle=\"collapse\"" }

        it 'removes the hash symbol from the collapse option for the aria-controls attribute' do
          expect(rendered_html).to include 'aria-controls="tested_collapse_id"'
          expect(rendered_html).not_to include 'aria-controls="#tested_collapse_id"'
        end

        context 'and when a button component is :button element' do
          let(:tested_as) { :button }
          it 'uses a data-target attribute to identify its collapse target' do
            expect(rendered_html).to include "data-target=\"#{tested_collapse}\""
          end

          it 'does not have an href for targeting the collapsible element' do
            expect(rendered_html).not_to include "href=\"#{tested_collapse}\""
          end

          it { expect(rendered_html).to eq "<button class=\"btn btn-primary\" data-toggle=\"collapse\" data-target=\"#{tested_collapse}\" aria-expanded=\"false\" aria-controls=\"#{tested_collapse.gsub('#', '')}\" role=\"button\" type=\"button\"></button>" }
        end

        context 'and when a button component is an :a element' do
          let(:tested_as) { :a }
          it 'uses the link href to identify its collapse target' do
            expect(rendered_html).to include "href=\"#{tested_collapse}\""
          end

          it 'does not use a data-target attribute to identify its collapse target' do
            expect(rendered_html).not_to include "data-target=\"#{tested_collapse}\""
          end
          it { expect(rendered_html).to eq "<a class=\"btn btn-primary\" data-toggle=\"collapse\" href=\"#{tested_collapse}\" aria-expanded=\"false\" aria-controls=\"#{tested_collapse.tr('#', '')}\" role=\"button\"></a>" }
        end
      end

      context 'when a button does not have :collapse in the options hash' do
        it { expect(rendered_html).not_to include "data-toggle=\"collapse\"" }
      end
    end

    describe 'button sizes' do
      let(:options) { { size: tested_size } }
      context 'when size is :sm' do
        let(:tested_size) { :sm }
        it 'outputs a small button' do
          expect(subject).to have_css '.btn-sm'
          expect(rendered_html).to eq "<a class=\"btn btn-sm btn-primary\" href=\"#\"></a>"
        end
      end

      context 'when size is :lg' do
        let(:tested_size) { :lg }
        it 'outputs a large button' do
          expect(subject).to have_css '.btn-lg'
          expect(rendered_html).to eq "<a class=\"btn btn-lg btn-primary\" href=\"#\"></a>"
        end
      end

      context 'when size is an invalid value' do
        let(:tested_size) { :not_sm_or_lg }
        it 'does not output a resized button' do
          expect(subject).not_to have_css ".btn-#{tested_size}"
          expect(rendered_html).to eq "<a class=\"btn btn-primary\" href=\"#\"></a>"
        end
      end

      context 'when size is not present in the options' do
        let(:options) { {} }
        it 'does not output a resized button' do
          expect(rendered_html).to eq "<a class=\"btn btn-primary\" href=\"#\"></a>"
        end
      end
    end
  end

  describe 'private methods' do
    describe '#assistive_html_attributes' do
      let(:options) { { active: tested_active } }
      let(:tested_active) { nil }
      subject { button.send(:assistive_html_attributes) }

      context 'when :active is true' do
        let(:tested_active) { true }
        it { is_expected.to include(aria: { pressed: true }) }
      end

      context 'when :active is false' do
        let(:tested_active) { false }
        it { is_expected.not_to include(aria: { pressed: true }) }
      end

      context 'when :active is not present' do
        let(:options) { {} }
        it { is_expected.not_to include(aria: { pressed: true }) }
      end
    end

    describe '#css_classes' do
      let(:options) { { block: tested_block } }
      subject { button.send(:css_classes) }

      context 'when :block is true in options' do
        let(:tested_block) { true }
        it { is_expected.to include 'btn-block' }
      end

      context 'when :block is false in options' do
        let(:tested_block) { false }
        it { is_expected.not_to include 'btn-block' }
      end

      context 'when :block is nil in options' do
        let(:tested_block) { nil }
        it { is_expected.not_to include 'btn-block' }
      end

      context 'when :block is not present in options' do
        let(:options) { {} }
        it { is_expected.not_to include 'btn-block' }
      end
    end

    describe '#collapse_data_attributes' do
      subject { button.send(:collapse_data_attributes) }
      let(:options) { { collapse: 'collapse_target', as: as } }

      context 'when collapse is an <a> tag' do
        let(:as) { :a }
        it { is_expected.not_to include :target }
      end

      context 'when collapse is not an <a> tag' do
        let(:as) { :button }
        it { is_expected.to include :target }
      end
    end

    describe '#component_css_class' do
      subject { button.send(:component_css_class) }
      context 'when remove_component_css_classes is true' do
        let(:options) { { remove_component_css_classes: true } }
        it { is_expected.to eq '' }
      end

      context 'when remove_component_css_classes is false' do
        let(:options) { { remove_component_css_classes: false } }
        it { is_expected.to eq 'btn' }
      end
    end

    describe '#default_html_wrapper_element' do
      subject { button.send(:default_html_wrapper_element) }
      it { is_expected.to eq :a }
    end

    describe '#non_html_attribute_options' do
      subject { button.send(:non_html_attribute_options) }
      it { is_expected.to include(:block, :remove_component_css_classes) }
    end
  end
end
