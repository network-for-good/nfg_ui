require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_embed.html.haml', type: :view do
  let(:embed) { FactoryBot.create(:bootstrap_embed, body: body, aspect_ratio: aspect_ratio, iframe: iframe) }
  let(:body) { nil }
  let(:iframe) { 'http://cnn.com' }
  let(:aspect_ratio) { nil }

  subject { embed.render }

  context 'when embed component has an :iframe option' do
    let(:iframe) { 'http://www.google.com' }
    it 'outputs the indended iframe' do
      expect(subject).to have_css '.embed-responsive.embed-responsive-16by9'
      expect(subject).to have_css '.embed-responsive iframe.embed-responsive-item'
      expect(subject).to eq "<div class=\"embed-responsive embed-responsive-16by9\"><iframe src=\"#{iframe}\" class=\"embed-responsive-item\" allowfullscreen=\"allowfullscreen\"></iframe></div>"
    end
  end

  context 'when embed component does not have an :iframe option' do
    let(:iframe) { nil }
    let(:body) { 'test body' }
    it 'outputs the intended component :body' do
      expect(subject).to have_css '.embed-responsive.embed-responsive-16by9'
      expect(subject).not_to have_css 'iframe'
      expect(subject).to eq "<div class=\"embed-responsive embed-responsive-16by9\">#{body}</div>"
    end
  end
end
