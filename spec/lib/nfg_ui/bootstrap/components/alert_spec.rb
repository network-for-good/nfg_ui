require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Alert do
  let(:alert) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  describe 'default class construction' do
    let(:options) { {} }
    it 'contains only the public methods and options it is expected to' do
      expect(alert.options).to eq(class: '', id: nil, body: nil, data: nil)
      expect(alert.view_context).to be
      expect(alert.id).to be_nil
      expect(alert.data).to be_nil
      expect(alert.body).to be_nil
    end
  end

  describe '#assistive_html_attributes' do
    subject { alert.send(:assistive_html_attributes) }
    it { is_expected.to eq(role: 'alert') }
  end

  it_behaves_like 'a component that includes the Dismissible utility module'
  it_behaves_like 'a component that includes the Themeable utility module'
end
