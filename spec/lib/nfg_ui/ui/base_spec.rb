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

  describe '#bootstrap' do
    subject { base_component.bootstrap(*component_args) }
    let(:body) { 'test' }
    let(:component_args) { [:button, [], { body: body}] }
    it 'renders a bootstrap component' do
      expect(subject).to eq "<a class=\"btn btn-primary\">#{body}\n</a>"
    end
  end

  describe '#nfg' do
    pending 'need spec for testing options render_if'
    subject { base_component.nfg(*component_args) }
    let(:body) { 'test' }
    let(:component_args) { [:button, [], { body: body}] }
    it 'renders an nfg component' do
      expect(subject).to eq "<a class=\"btn btn-primary\">#{body}\n</a>\n"
    end
  end
end
