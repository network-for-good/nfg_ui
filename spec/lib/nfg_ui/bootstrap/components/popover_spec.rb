require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Popover do
  subject { described_class }
  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#render' do
    it_behaves_like 'a simple rendered component with a body'
  end
end
