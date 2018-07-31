require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_badge.html.haml', type: :view do
  
  let(:badge) { FactoryBot.create(:bootstrap_badge, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/badge', badge: badge }

  describe 'html output for the bootstrap badge' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap badge component in html' do
      expect(subject).to have_css '.badge'
      expect(subject).to have_selector '.badge', text: body
      expect(subject).to eq "<span class='badge'>\n#{body}\n</span>\n"
    end
  end

  describe 'Pill badges' do
    let(:options) { { pill: pill } }
    context 'when :pill is true' do
      let(:pill) { true }
      it { is_expected.to have_css '.badge.badge-pill' }
    end

    context 'when pill is false' do
      let(:pill) { false }
      it { is_expected.not_to have_css '.badge.badge-pill' }
      it { is_expected.to have_css '.badge' }
    end
  end
end
