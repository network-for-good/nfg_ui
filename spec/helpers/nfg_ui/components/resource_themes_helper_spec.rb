require 'rails_helper'

RSpec.describe NfgUi::Components::ResourceThemesHelper do
  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::ResourceThemeable }
end
