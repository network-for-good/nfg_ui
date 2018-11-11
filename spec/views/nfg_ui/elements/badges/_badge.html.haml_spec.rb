require 'rails_helper'

RSpec.describe 'nfg_ui/elements/badges/_badge.html.haml', type: :view do
  let(:badge) { FactoryBot.create(:badge, traits: traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { render 'nfg_ui/elements/badges/badge', badge: badge }

  describe 'the badge html component' do
    it 'renders the bootstrap badge' do
      expect(subject).to render_template(partial: 'nfg_ui/bootstrap/_badge')
    end
  end
end
