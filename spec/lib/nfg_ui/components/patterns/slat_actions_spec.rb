require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::SlatActions do
  # This utility is consumed by SlatAction
  let(:options) { {} }
  let(:view_context) { ActionController::Base.new.view_context }
  let(:slat_actions) { described_class.new(options, view_context) }


  describe 'the rendered HTML' do
    let(:options) { {} }
    subject { slat_actions.render }

    it 'renders the component' do
      expect(subject).to eq "<div class=\"slat-actions\" href=\"#\"><div class=\"dropdown\"><button class=\"btn dropdown-toggle btn-outline-secondary\" data-toggle=\"dropdown\" aria-haspopup=\"true\" aria-expanded=\"false\" type=\"button\"><span class=\"slat-actions-text\">Actions</span><i aria-hidden=\"true\" class=\"fa fa-caret-down ml-1\"></i></button><div class=\"dropdown-menu dropdown-menu-right\"></div></div></div>"
    end
  end

  describe '#component_family' do
    subject { slat_actions.component_family }
    it { is_expected.to eq :slats }
  end

  describe '#menu' do
    let(:options) { { menu: tested_menu } }
    let(:tested_menu) { nil }

    subject { slat_actions.menu }

    context 'when :menu is present in the options' do
      let(:tested_menu) { true }
      it { is_expected.to eq tested_menu }
    end

    context 'when :menu is not present in the options' do
      let(:options) { {} }
      it { is_expected.to be }
    end
  end

  describe '#render' do
    subject { slat_actions.render }

    context 'when :menu is true in options' do
      let(:options) { { menu: true, **additional_options } }
      let(:additional_options) { {} }

      it 'renders the full component' do
        by 'rendering the slat actions within the dropdown menu' do
          expect(subject).to include "<div class=\"slat-actions\" href=\"#\"><div class=\"dropdown\">"
        end

        and_by 'rendering the secondary outlined dropdown toggle' do
          expect(subject).to include "<button class=\"btn dropdown-toggle btn-outline-secondary\" data-toggle=\"dropdown\""
        end

        and_by 'rendering the default language for the action menu' do
          expect(subject).to include "<span class=\"slat-actions-text\">Actions</span><i aria-hidden=\"true\" class=\"fa fa-caret-down ml-1\"></i>"
        end

        and_by 'rendering the dropdown menu on the right' do
          expect(subject).to include "<div class=\"dropdown-menu dropdown-menu-right\">"
        end
      end
    end

    # This is extensively tested in
    # spec/lib/nfg_ui/components/utilities/patches/integrated_slat_action_spec.rb
    context 'when :menu is false' do
      let(:options) { { menu: false } }
      it { is_expected.to include slat_actions.send(:render_integrated_slat_action) }
    end
  end
end