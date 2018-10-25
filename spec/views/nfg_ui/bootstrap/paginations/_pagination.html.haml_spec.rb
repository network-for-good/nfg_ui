require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/paginations/_pagination.html.haml', type: :view do
  let(:pagination) { FactoryBot.create(:bootstrap_pagination, **options) }
  let(:options) { {} }
  subject { render 'nfg_ui/bootstrap/paginations/pagination', pagination: pagination }

  describe 'component html' do
    let(:tested_body) { 'tested body' }
    let(:options) { { body: tested_body } }
    it 'outputs a bootstrap pagination component in html' do
      expect(subject).to have_selector 'nav ul.pagination'
      expect(subject).to eq "<nav>\n<ul class='pagination'>\n#{tested_body}\n</ul>\n</nav>\n"
    end
  end

  describe 'an aligned pagination' do
    describe 'right aligned pagination' do
      context 'when right is true in options' do
        let(:options) { { right: true } }
        it 'outputs a right aligned navigation' do
          expect(subject).to have_css 'ul.pagination.justify-content-end'
          expect(subject).to eq "<nav>\n<ul class='pagination justify-content-end'>\n\n</ul>\n</nav>\n"
        end
      end

      context 'when right is not present in options' do
        let(:options) { {} }
        it 'does not output a right aligned navigation' do
          expect(subject).not_to have_css 'ul.pagination.justify-content-end'
          expect(subject).to have_css 'ul.pagination'
        end
      end
    end

    describe 'center aligned pagination' do
      context 'when center is true in options' do
        let(:options) { { center: true } }
        it 'outputs a center aligned navigation' do
          expect(subject).to have_css 'ul.pagination.justify-content-center'
          expect(subject).to eq "<nav>\n<ul class='pagination justify-content-center'>\n\n</ul>\n</nav>\n"
        end
      end

      context 'when center is not present in options' do
        let(:options) { {} }
        it 'does not output a center aligned navigation' do
          expect(subject).not_to have_css 'ul.pagination.justify-content-center'
          expect(subject).to have_css 'ul.pagination'
        end
      end
    end
  end

  describe 'resized pagination' do
    context 'when size is present' do
      let(:tested_size) { :lg }
      let(:options) { { size: tested_size } }
      it 'outputs a resized pagination component' do
        expect(subject).to have_css "ul.pagination.pagination-#{tested_size}"
        expect(subject).to eq "<nav>\n<ul class='pagination pagination-lg'>\n\n</ul>\n</nav>\n"
      end
    end

    context 'when size is not present' do
      let(:options) { {} }
      it 'does not output a resized pagination component' do
        expect(subject).not_to have_css "[class*='pagination-']"
      end
    end
  end
end
