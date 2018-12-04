require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/media/_media.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:media) { FactoryBot.create(:bootstrap_media, body: body) }
  subject { media.render }

  it 'outputs a bootstrap media component in html' do
    expect(subject).to have_css '.media'
    expect(subject).to have_selector '.media', text: body
    expect(subject).to eq "<div class=\"media\">#{body}</div>"
  end
end
