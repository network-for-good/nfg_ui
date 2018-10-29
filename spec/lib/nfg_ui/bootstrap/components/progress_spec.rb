require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Progress do
  let(:progress) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module'

  pending 'Progress specs needed once decisions are made about multiple progress bars - This impacts how many of the progress bar features work'

  describe '#animated' do
    subject { progress.animated }
  end

  describe '#height' do
    subject { progress.height }
  end

  describe '#label' do
    subject { progress.label }
  end

  describe '#progress' do
    subject { progress.progress }
  end

  describe '#progress_wrapper_html_options' do
    subject { progress.progress_wrapper_html_options }
  end

  describe '#striped' do
    subject { progress.striped }
  end

  describe '#style' do
    subject { progress.style }
  end

  describe 'private methods' do
    describe '#assistive_html_attributes' do
      subject { progress.send(:assistive_html_attributes) }
    end

    describe '#component_css_class' do
      subject { progress.send(:component_css_class) }
    end

    describe '#css_classes' do
      subject { progress.send(:css_classes) }
    end

    describe '#default_progress_wrapper_html_options' do
      subject { progress.send(:default_progress_wrapper_html_options) }
    end

    describe '#non_html_attribute_options' do
      subject { progress.send(:non_html_attribute_options) }
    end

    describe '#theme_css_class_prefix' do
      subject { progress.send(:theme_css_class_prefix) }
    end
  end
end
