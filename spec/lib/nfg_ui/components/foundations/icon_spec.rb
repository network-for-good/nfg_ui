require 'rails_helper'

RSpec.describe NfgUi::Components::Foundations::Icon do
  let(:icon) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module'
  it_behaves_like 'a component that includes the Theme trait module'

  it { expect(described_class).to include NfgUi::Components::Traits::Icon }

  pending 'Icon component needs specs'

  describe '#icon' do
    subject { icon.icon }
  end

  describe '#text' do
    subject { icon.text }
  end

  describe '#right' do
    subject { icon.right }
  end

  describe 'private methods' do
    describe '#css_classes' do
      subject { icon.send(:css_classes) }
    end

    describe '#theme_css_class_prefix' do
      subject { icon.send(:theme_css_class_prefix) }
    end

    describe '#default_theme' do
      subject { icon.send(:default_theme) }
    end

    describe '#non_html_attribute_options' do
      subject { icon.send(:non_html_attribute_options) }
    end
  end
end
