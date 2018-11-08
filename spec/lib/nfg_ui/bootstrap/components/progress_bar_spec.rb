require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ProgressBar do
  let(:progress_bar) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module', component_suite: :bootstrap

  describe '#outlineable?' do
    subject { progress_bar.send(:outlineable?) }
    it { is_expected.not_to be }
  end
end
