require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::Traitable do
  let(:traitable_component) { NfgUi::Components::Base.new(options.merge(traits: traits), view_context) }
  let(:view_context) { ActionController::Base.new.view_context }
  let(:options) { {} }
  let(:traits) { [] }

  it { expect(described_class.included_modules).to include NfgUi::Components::Traits }

  describe '#traits' do
    subject { traitable_component.traits }
    context 'when traits are present' do
      let(:traits) { [:test] }
      it { is_expected.to eq traits }
    end

    context 'when traits are not present' do
      it { is_expected.to eq([]) }
    end
  end

  describe 'private methods' do
    # Sanity check
    describe '#initialize_traits' do
      subject { traitable_component }
      let(:traitable_component) { view_context.ui.nfg(:alert, *traits) }
      subject { traitable_component }

      context 'when traits are present' do
        let(:traits) { [:warning] }

        it 'outputs an alert with a warning theme trait applied' do
          by 'not rendering the alert with the default theme of primary' do
            expect(subject).not_to include "<div class='alert alert-primary"
          end

          and_by 'applying the warning theme trait to the alert' do
            expect(subject).to include "<div class='alert alert-warning"
          end
        end
      end

      context 'when traits are not present' do
        let(:traits) { [] }
        it 'outputs an alert with a the default theme unmodified by a trait' do
          expect(subject).to include "<div class='alert alert-primary"
        end
      end
    end
  end
end
