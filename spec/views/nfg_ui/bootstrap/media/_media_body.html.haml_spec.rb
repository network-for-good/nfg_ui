require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/media/_media_body.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:media_body) { FactoryBot.create(:bootstrap_media_body, body: body) }
  subject { render 'nfg_ui/bootstrap/media/media_body', media_body: media_body }

  it 'outputs a bootstrap media component in html' do
    expect(subject).to have_css '.media-body'
    expect(subject).to have_selector '.media-body', text: body
    expect(subject).to eq "<div class='media-body'>\n#{body}\n</div>\n"
  end
end
