require 'rails_helper'

RSpec.describe NfgUi::Components::Base do
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  describe 'included modules' do
    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Describable }
    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Renderable }
    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }
  end
end
