require 'rails_helper'

RSpec.describe NfgUi::Components::Foundations::Typeface do
  let(:typeface) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  let(:traits) { [] }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module'
  it_behaves_like 'a component that includes the Wrappable utility module'
  it_behaves_like 'a component that includes the Iconable utility module'
  it_behaves_like 'a component that includes the Titleable utility module'
  it_behaves_like 'a component that includes the Theme trait module'

  pending 'Typeface specs needed'

  describe '#heading' do
    subject { typeface.heading }
  end

  describe '#text_or_icon' do
    subject { typeface.heading }
  end

  describe 'private themes' do
    describe '#theme_css_class_prefix' do
      subject { typeface.send(:theme_css_class_prefix) }
    end

    describe '#default_theme' do
      subject { typeface.send(:default_theme) }
    end

    describe '#text' do
      subject { typeface.send(:text) }
    end

    describe '#automatic_as' do
      subject { typeface.send(:automatic_as) }
    end

    describe '#component_css_class' do
      subject { typeface.send(:component_css_class) }
    end

    describe '#non_html_attribute_options' do
      subject { typeface.send(:non_html_attribute_options) }
    end

    describe '#body_tag' do
      subject { typeface.send(:body_tag) }
    end

    describe '#heading_tag' do
      subject { typeface.send(:heading_tag) }
    end

    describe '#title_tag' do
      subject { typeface.send(:title_tag) }
    end
  end
end
