require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::Button do
  let(:button) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Button }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Iconable utility module'
  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Renderable utility module'

  it_behaves_like 'a component that includes the Size trait module'
  it_behaves_like 'a component that includes the Theme trait module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }

  describe '#data' do
    let(:options) { {} }
    subject { button.data }

    context 'when :dismiss is true in options' do
      let(:options) { { data: { dismiss: true, **data_attributes } } }
      let(:data_attributes) { {} }

      context 'and when data attributes are present' do
        let(:test_keyword) { :keyword }
        let(:test_value) { :value }
        let(:data_attributes) { { test_keyword => test_value } }

        it 'merges the data attributes together' do
          expect(subject).to eq({ test_keyword => test_value, dismiss: true })
        end

        it { expect(button.options).to include({ data: { test_keyword => test_value, dismiss: true } }) }
      end

      context 'and when data attributes are not present' do
        let(:data_attributes) { {} }
        it { is_expected.to eq({ dismiss: true }) }
        it { expect(button.options).to include({ data: { dismiss: true } }) }
      end
    end
  end

  describe '#close' do
    pending 'not yet functional'
  end

  describe '#dismiss' do
    subject { button.dismiss }

    context 'when :dismiss is present in options' do
      let(:tested_dismiss) { :tested_dismiss }
      let(:options) { { dismiss: tested_dismiss } }
      it { is_expected.to eq tested_dismiss }
    end

    context 'when :dismiss is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#method' do
    subject { button.send(:method) }

    context 'when :method is present in options' do
      let(:tested_method) { :tested_method }
      let(:options) { { method: tested_method } }
      it { is_expected.to eq tested_method }
    end

    context 'when :method is not present in options' do
      let(:options) { {} }
      it { is_expected.to be_nil }
    end
  end

  describe '#render' do
    subject { button.render }
    let(:tested_disabled) { nil }
    let(:tested_tooltip) { nil }
    let(:options) { { tooltip: tested_tooltip, disabled: tested_disabled } }

    context 'when tooltipped and disabled' do
      let(:tested_disabled) { true }
      let(:tested_tooltip) { 'test tooltip' }

      it 'renders a tooltipped disabled button' do
        expect(subject).to eq "<span data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\" class=\"d-inline-block\" tabindex=\"0\"><a class=\"btn disabled btn-primary\" href=\"#\" tabindex=\"-1\" style=\"pointer-events: none;\"></a></span>"
      end
    end

    context 'when not tooltipped and disabled' do
      context 'when an icon is present' do
        let(:tested_icon) { 'rocket' }
        let(:options) { { icon: tested_icon } }

        it 'renders an icon without any special spacing unitilites added to the icon html' do
          expect(subject).to eq "<a class=\"btn btn-primary\" href=\"#\"><i aria-hidden=\"true\" class=\"fa fa-#{tested_icon}\"></i></a>"

          and_it 'includes the icon as expected' do
            expect(subject).to include "class=\"fa fa-"
          end
        end
      end

      context 'and when an icon is not present' do
        let(:options) { {} }
        it 'renders a button without a body as expected' do
          expect(subject).to eq "<a class=\"btn btn-primary\" href=\"#\"></a>"

          and_it 'does not include the icon' do
            expect(subject).not_to include "class=\"fa fa-"
          end
        end
      end
    end
  end

  describe 'private methods' do
    describe '#left_icon_component' do
      let(:tested_left_icon) { 'heart' }
      let(:options) { { left_icon: tested_left_icon } }

      subject { button.send(:left_icon_component) }

      it 'renders an icon using the :left_icon option' do
        expect(subject).to eq "<i aria-hidden=\"true\" class=\"fa fa-#{tested_left_icon} mr-1\"></i>"

        and_it 'adds the correct spacer class to the icon for a sanity check' do
          expect(subject).to include "class=\"fa fa-#{tested_left_icon} mr-1\""
        end
      end
    end

    describe '#right_icon_component' do
      let(:tested_right_icon) { 'heart' }
      let(:options) { { icon: tested_right_icon } }

      subject { button.send(:right_icon_component) }

      it 'renders an icon on the right using the :icon option' do
        expect(subject).to eq "<i aria-hidden=\"true\" class=\"fa fa-#{tested_right_icon} ml-1\"></i>"

        and_it 'adds the correct spacer class to the icon for a sanity check' do
          expect(subject).to include "class=\"fa fa-#{tested_right_icon} ml-1\""
        end
      end
    end

    describe '#dismiss_component?' do
      subject { button.send(:dismiss_component?) }
      let(:tested_dismiss) { nil }
      let(:options) { { dismiss: tested_dismiss } }

      context 'when :dismiss is :alert in options' do
        let(:tested_dismiss) { :alert }
        it { is_expected.to be }
      end

      context 'when :dismiss is :modal in options' do
        let(:tested_dismiss) { :modal }
        it { is_expected.to be }
      end

      context 'when :dimiss is not present' do
        let(:options) { {} }
        it { is_expected.to be_falsy }
      end

      context 'when :dimiss is neither :alert, or :modal' do
        let(:tested_dismiss) { :arbitrary_example }
        it { is_expected.not_to be }
      end
    end

    describe '#non_html_attribute_options' do
      subject { button.send(:non_html_attribute_options) }

      it { is_expected.to include :dismiss }
    end
  end
end
