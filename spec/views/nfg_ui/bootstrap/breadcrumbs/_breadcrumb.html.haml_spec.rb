require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/breadcrumbs/_breadcrumb.html.haml', type: :view do
  let(:breadcrumb) { FactoryBot.create(:bootstrap_breadcrumb, **options) }
  let(:options) { {} }
  subject { breadcrumb.render }

  describe 'html output for the bootstrap breadcrumb' do
    let(:options) { { body: body } }
    let(:body) { 'test body content' }

    it 'outputs a bootstrap breadcrumb component in html' do
      expect(subject).to have_css "nav[aria-label='breadcrumb'] .breadcrumb"
      expect(subject).to have_selector '.breadcrumb', text: body
      expect(subject).to eq "<nav aria-label=\"breadcrumb\"><ol class=\"breadcrumb\">#{body}</ol></nav>"
    end
  end
end
