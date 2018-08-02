require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Pagination do
  subject { described_class }
  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
end
