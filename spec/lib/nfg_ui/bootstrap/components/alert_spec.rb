require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Alert do
  let(:alert) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Dismissible utility module'
  it_behaves_like 'a component that includes the Themeable utility module'
  
  describe 'private themes' do
    describe '#assistive_html_attributes' do
      subject { alert.send(:assistive_html_attributes) }
      it { is_expected.to eq(role: 'alert') }
    end
  end

  describe '#css_classes' do
    subject { alert.send(:css_classes) }
    pending 'spec needed for css_classes'
  end
end
