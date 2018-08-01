require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_embed.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:embed) { FactoryBot.create(:bootstrap_embed, body: body) }
  subject { render 'nfg_ui/bootstrap/embed', embed: embed }

  it 'outputs a bootstrap embed component in html' do
    # expect(subject).to have_css '.embed'
    # expect(subject).to have_css ".embed[role='embed']"
    # expect(subject).to have_selector '.embed', text: body
    expect(subject).to eq "<div class='embed-responsive embed-responsive-16by9'>\n<iframe src=\"http://www.google.com\" class=\"embed-responsive-item\" allowfullscreen=\"allowfullscreen\"></iframe>\n</div>\n"
  end
end
