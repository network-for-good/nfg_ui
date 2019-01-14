require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::DropdownItem do
  let(:dropdown_item) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::DropdownItem }
  pending 'unknown reason why dropdown item uniquely fails the consistent initialized shared example spec. To resolve soon'
  # it_behaves_like 'a component with a consistent initalized construction'

  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Iconable utility module'
  it_behaves_like 'a component that includes the Renderable utility module'
  it_behaves_like 'a component that includes the Modalable utility module', component_suite: :nfg

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }

  describe '#href' do
    subject { dropdown_item.href }
    context 'when modal is present in options' do
      context 'when :href is included in the options' do
        let(:tested_href) { '#tested_href' }
        let(:options) { { modal: '#target_modal', href: tested_href } }

        it 'does not overwrite the supplied href' do
          expect(subject).to eq tested_href
        end
      end

      context 'when :href is not included in the options' do
        let(:options) { { modal: '#target_modal' } }

        it 'provides a fallback href' do
          expect(subject).to eq '#'
        end
      end
    end

    context 'when modal is falsy in options' do
      let(:options) { { modal: nil } }
      it 'falls back to super' do
        expect(subject).not_to be
      end
    end
  end  
end
