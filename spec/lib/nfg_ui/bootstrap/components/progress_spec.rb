require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Progress do
  let(:progress) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  it_behaves_like 'a component with a consistent initalized construction'

  it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Progressable }

  describe '#component_family' do
    subject { progress.component_family }
    it { is_expected.to eq :progress }
  end

  describe '#height' do
    let(:tested_option) { :height }
    subject { progress.height }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end
end
