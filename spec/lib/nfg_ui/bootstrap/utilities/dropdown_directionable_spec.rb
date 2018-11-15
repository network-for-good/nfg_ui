require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::DropdownDirectionable do
  # Dropdown is DropdownDirectionable
  let(:dropdown) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  pending 'coming soon'

  # describe '#dropleft' do
  #   subject { dropdown.dropleft }

  #   context 'when dropleft is true in options' do
  #     let(:options) { { dropleft: true } }
  #     it { is_expected.to be }
  #   end

  #   context 'when dropleft is not supplied options' do
  #     let(:options) { {} }
  #     it { is_expected.not_to be }
  #   end

  #   context 'when dropleft is nil in supplied options' do
  #     let(:options) { { dropleft: nil } }
  #     it { is_expected.to be_falsey }
  #   end
  # end

  # describe '#dropright' do
  #   subject { dropdown.dropright }

  #   context 'when dropright is true in options' do
  #     let(:options) { { dropright: true } }
  #     it { is_expected.to be }
  #   end

  #   context 'when dropright is not supplied options' do
  #     let(:options) { {} }
  #     it { is_expected.not_to be }
  #   end

  #   context 'when dropright is nil in supplied options' do
  #     let(:options) { { dropright: nil } }
  #     it { is_expected.to be_falsey }
  #   end
  # end

  # describe '#dropup' do
  #   subject { dropdown.dropup }

  #   context 'when dropup is true in options' do
  #     let(:options) { { dropup: true } }
  #     it { is_expected.to be }
  #   end

  #   context 'when dropup is not supplied options' do
  #     let(:options) { {} }
  #     it { is_expected.not_to be }
  #   end

  #   context 'when dropup is nil in supplied options' do
  #     let(:options) { { dropup: nil } }
  #     it { is_expected.to be_falsey }
  #   end
  # end

  # describe 'private methods' do
  #   subject { dropdown.send(tested_method) }

  #   describe '#css_classes' do
  #     let(:tested_method) { :css_classes }

  #     context 'when no drop settings are in options' do
  #       let(:options) { {} }
  #       it { is_expected.to eq 'dropdown' }
  #     end

  #     context 'when dropdown component implements dropleft' do
  #       let(:options) { { dropleft: tested_dropleft } }
  #       let(:tested_dropleft) { nil }
  #       context 'when dropleft is true in options' do
  #         let(:tested_dropleft) { true }
  #         it { is_expected.to eq 'dropdown dropleft' }
  #       end

  #       context 'when dropleft is false in options' do
  #         let(:tested_dropleft) { false }
  #         it { is_expected.to eq 'dropdown' }
  #       end

  #       context 'when dropleft is nil in options' do
  #         let(:tested_dropleft) { nil }
  #         it { is_expected.to eq 'dropdown' }
  #       end

  #       context 'when dropleft is not present in options' do
  #         let(:options) { {} }
  #         it { is_expected.to eq 'dropdown' }
  #       end
  #     end

  #     context 'when dropdown component implements dropright' do
  #       let(:options) { { dropright: tested_dropright } }
  #       let(:tested_dropright) { nil }
  #       context 'when dropright is true in options' do
  #         let(:tested_dropright) { true }
  #         it { is_expected.to eq 'dropdown dropright' }
  #       end

  #       context 'when dropright is false in options' do
  #         let(:tested_dropright) { false }
  #         it { is_expected.to eq 'dropdown' }
  #       end

  #       context 'when dropright is nil in options' do
  #         let(:tested_dropright) { nil }
  #         it { is_expected.to eq 'dropdown' }
  #       end

  #       context 'when dropright is not present in options' do
  #         let(:options) { {} }
  #         it { is_expected.to eq 'dropdown' }
  #       end
  #     end

  #     context 'when dropdown component implements dropup' do
  #       let(:options) { { dropup: tested_dropup } }
  #       let(:tested_dropup) { nil }
  #       context 'when dropup is true in options' do
  #         let(:tested_dropup) { true }
  #         it { is_expected.to eq 'dropdown dropup' }
  #       end

  #       context 'when dropup is false in options' do
  #         let(:tested_dropup) { false }
  #         it { is_expected.to eq 'dropdown' }
  #       end

  #       context 'when dropup is nil in options' do
  #         let(:tested_dropup) { nil }
  #         it { is_expected.to eq 'dropdown' }
  #       end

  #       context 'when dropup is not present in options' do
  #         let(:options) { {} }
  #         it { is_expected.to eq 'dropdown' }
  #       end
  #     end
  #   end
  # end
end
