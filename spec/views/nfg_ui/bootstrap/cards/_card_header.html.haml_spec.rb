require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/cards/_card_header.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:card_header) { FactoryBot.create(:bootstrap_card_header, **options) }
  let(:options) { {} }
  subject { card_header.render }

  context 'when a heading is provided' do
    let(:options) { { heading: heading } }
    let(:heading) { "My header" }

    it 'outputs a bootstrap card_header component and includes the heading' do
      expect(subject).to include("<div class=\"card-header\">#{ heading }</div>")
    end
  end

  context "when a body is passed" do
    let(:options) { { body: body} }
    let(:body) { "My body" }

    it 'outputs a bootstrap card_header component and includes the body' do
      expect(subject).to include("<div class=\"card-header\">#{ body }</div>")
    end
  end

  context "when both the body and the header are included" do
    let(:options) { { heading: heading, body: body } }
    let(:heading) { "My header" }
    let(:body) { "My body" }

    it 'outputs a bootstrap card_header component and includes the heading' do
      expect(subject).to include("<div class=\"card-header\">#{ heading }</div>")
    end
  end

  context "when a block is provided to render" do
    subject { card_header.render { block } }
    let(:block) { "My block" }

    it 'outputs a bootstrap card_header component and includes the block' do
      expect(subject).to include("<div class=\"card-header\">#{ block }</div>")
    end

    context 'and a heading is included' do
      let(:options) { { heading: heading} }
      let(:heading) { "My heading" }

      it 'outputs a bootstrap card_header component and includes the heading' do
        expect(subject).to include("<div class=\"card-header\">#{ heading }</div>")
      end
    end
  end
end
