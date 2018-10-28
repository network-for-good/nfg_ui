require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::PageHeader do
  let(:page_header) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Titleable utility module'

  pending 'PageHeader specs needed'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::BrowserDetectable }
  it { expect(described_class.included_modules).to include NfgUi::Components::Traits::PageHeader }

  describe '#data' do
    subject { page_header.data }
  end

  describe '#sticky' do
    subject { page_header.sticky }
  end

  describe '#subtitle' do
    subject { page_header.subtitle }
  end

  describe '#title_column_classes' do
    subject { page_header.title_column_classes }
  end

  describe 'private methods' do
    describe '#non_html_attribute_options' do
      subject { page_header.non_html_attribute_options }
    end
  end
end
