require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ButtonGroup do
  let(:button_group) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  subject { described_class }

  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Sizable utility module'
  it_behaves_like 'a component that includes the DropdownDirectionable utility module'

  describe '#vertical' do
    let(:options) { { vertical: tested_vertical } }
    let(:tested_vertical) { nil }
    subject { button_group.vertical }

    context 'when vertical is true' do
      let(:tested_vertical) { true }
      it { is_expected.to be }
    end

    context 'when vertical is false' do
      let(:tested_vertical) { false }
      it { is_expected.to be false }
    end

    context 'when vertical is nil' do
      let(:tested_vertical) { nil }
      it { is_expected.to be_falsey }
    end

    context 'when vertical is not present' do
      let(:options) { {} }
      it { is_expected.to be_falsey }
    end
  end

  describe 'private methods' do
    describe '#assistive_html_attributes' do
      subject { button_group.send(:assistive_html_attributes) }
      it { is_expected.to eq(role: 'group', aria: { label: 'action buttons' }) }
    end

    describe '#component_css_class' do
      subject { button_group.send(:component_css_class) }
      it { is_expected.to eq 'btn-group' }
    end

    describe '#css_classes' do
      subject { button_group.send(:css_classes) }
      pending 'spec needed for button_group#css_classes'
    end
  end
end
