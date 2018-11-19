require 'rails_helper'

RSpec.describe NfgUi::UI::Base do
  let(:view_context) { action_controller_base_view_context }
  let(:action_controller_base_view_context) { ActionController::Base.new.view_context }
  let(:base_component) { NfgUi::UI::Base.new(view_context) }

  subject { base_component }

  pending 'specs needed'

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
      expect(subject).to eq "<a class=\"btn btn-primary\" href=\"#\">#{body}\n</a>"
    end
  end

  describe '#nfg' do
    shared_examples 'a rendered nfg button component' do
      it 'renders an nfg button component' do
        expect(subject).to eq "<a class=\"btn btn-primary\" href=\"#\">#{body}\n</a>"
      end
    end

    subject { base_component.nfg(*component_args) }
    let(:body) { 'test' }
    let(:options) {{ body: body }}
    let(:component_args) { [:button, [], options] }
    it_behaves_like 'a rendered nfg button component'

    context 'when render_if is used' do
      let(:options) {{ body: body, render_if: render_if }}
      context 'when render_if is true' do
        let(:render_if) { true }
        it_behaves_like 'a rendered nfg button component'
      end

      context 'when render_if is false' do
        let(:render_if) { false }
        it 'returns nil' do
          expect(subject).to eq nil
        end
      end

      context 'when render_if is nil' do
        let(:render_if) { nil }
        it 'returns nil' do
          expect(subject).to eq nil
        end
      end
    end

    context 'when render_unless is used' do
      let(:options) {{ body: body, render_unless: render_unless }}
      context 'when render_if is true' do
        let(:render_unless) { true }
        it 'returns nil' do
          expect(subject).to eq nil
        end
      end

      context 'when render_if is false' do
        let(:render_unless) { false }
        it_behaves_like 'a rendered nfg button component'
      end

      context 'when render_if is nil' do
        let(:render_unless) { nil }
        it_behaves_like 'a rendered nfg button component'
      end
    end
  end
end
