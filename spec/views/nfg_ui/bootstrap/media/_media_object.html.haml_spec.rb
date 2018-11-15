require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/media/_media_object.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:media_object) { FactoryBot.create(:bootstrap_media_object, body: body) }
  subject { render 'nfg_ui/bootstrap/media/media_object', media_object: media_object }

  it 'outputs a bootstrap media_object component in html' do
    expect(subject).not_to have_css '.media-object'
    expect(subject).to have_text body
    expect(subject).to eq "#{body}\n"
  end
end
