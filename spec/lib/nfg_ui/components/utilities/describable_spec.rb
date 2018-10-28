require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::Describable do
  subject { described_class }

  pending 'Spec for Describable needed'

  describe '#describe' do
    subject { described_class.describe }
  end

  describe '#data' do
    subject { described_class.data }
  end

  describe 'private methods' do
    describe '#non_html_attribute_options' do
      subject { described_class.send(:non_html_attribute_options) }
    end
  end
end
