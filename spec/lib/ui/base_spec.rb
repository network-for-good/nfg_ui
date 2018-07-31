require 'rails_helper'

RSpec.describe NfgUi::UI::Base do
  let(:view_context) { action_controller_base_view_context }
  let(:action_controller_base_view_context) { ActionController::Base.new.view_context }
  let(:base_component) { NfgUi::UI::Base.new(view_context) }

  subject { base_component }

  describe '#initialize' do
    subject { base_component.view_context }
    it { is_expected.to eq action_controller_base_view_context }
  end

  describe 'Desired component suite creation methods' do
    subject { base_component }

    it 'responds to #bootstrap method' do
      expect(subject).to respond_to :bootstrap
    end

    it 'responds to #nfg method' do
      expect(subject).to respond_to :nfg
    end
  end
end