require 'rails_helper'

RSpec.describe 'nfg_ui/elements/badges/_badge.html.haml', type: :view do
  let(:badge) { FactoryBot.create(:badge, traits: traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { badge.render }

  pending 'specs needed after icon update'
end
