require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_media_object.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:media_object) { FactoryBot.create(:bootstrap_media_object, body: body) }
  subject { render 'nfg_ui/bootstrap/media_object', media_object: media_object }

  pending 'coming soon'

  it 'outputs a bootstrap media_object component in html' do
  end
end
