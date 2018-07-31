require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::MediaObject do
  subject { described_class }
  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
end
