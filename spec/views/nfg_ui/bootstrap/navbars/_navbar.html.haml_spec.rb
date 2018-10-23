require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/navbars/_navbar.html.haml', type: :view do
  let(:body) { 'test body content' }
  let(:navbar) { FactoryBot.create(:bootstrap_navbar, body: body, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/navbars/navbar', navbar: navbar }

  it 'outputs a default bootstrap navbar component in html' do
    expect(subject).to have_selector '.navbar', text: body
    expect(subject).to eq "<nav class=\"navbar bg-light navbar-expand-lg navbar-light\">#{body}\n</nav>"
  end

  describe 'a custom wrapper element applied to the navbar' do
    context 'when a custom wrapper element is set via :as in the options' do
      let(:tested_element) { :div }
      let(:options) { { as: tested_element } }
      it 'applies the custom wrapper element and adds the navigation role' do
        expect(subject).to have_css "#{tested_element}.navbar[role='navigation']"
        expect(subject).to eq "<#{tested_element} class=\"navbar bg-light navbar-expand-lg navbar-light\" role=\"navigation\">#{body}\n</#{tested_element}>"
      end
    end

    context 'when a custom wrapper element is not set via :as in the options' do
      let(:options) { {} }
      it 'does not apply a navigation roll and utilizes the nav fallback element' do
        expect(subject).not_to have_css "navbar[role='navigation']"
        expect(subject).to eq "<nav class=\"navbar bg-light navbar-expand-lg navbar-light\">#{body}\n</nav>"
      end
    end
  end
end
