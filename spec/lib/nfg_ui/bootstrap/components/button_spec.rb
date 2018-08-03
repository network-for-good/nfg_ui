require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Button do
  subject { described_class }
  it { is_expected.to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Themeable utility module'
  it_behaves_like 'a component that includes the Wrappable utility module'
  it_behaves_like 'a component that includes the Activatable utility module'
  it_behaves_like 'a component that includes the Sizable utility module'
  it_behaves_like 'a component that includes the Disableable utility module'
end
