require 'rails_helper'

RSpec.describe 'nfg_ui/elements/badges/_badge.html.haml', type: :view do
  let(:badge) { FactoryBot.create(:badge, traits: traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { render 'nfg_ui/elements/badges/badge', badge: badge }

  pending 'specs needed after icon update'
end
