require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::Tile do
  let(:tile) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Collapsible utility module'
  it_behaves_like 'a component that includes the Iconable utility module'
  it_behaves_like 'a component that includes the Titleable utility module'
  it_behaves_like 'a component that includes the Collapse trait module'
  
  pending 'Tile specs needed'

  describe '#heading' do
    subject { tile.heading }
  end

  describe '#component_family' do
    subject { tile.heading }
  end

  describe 'private methods' do
    describe '#non_html_attribute_options' do
      subject { tile.send(:non_html_attribute_options) }
    end
  end
end
