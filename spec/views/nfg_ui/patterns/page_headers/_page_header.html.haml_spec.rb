require 'rails_helper'

RSpec.describe 'nfg_ui/patterns/page_headers/_page_header.html.haml', type: :view do
  let(:page_header) { FactoryBot.create(:page_header, *traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { page_header.render }

  pending 'Page header specs needed'

  it { is_expected.to have_css '.container-fluid' }

  describe 'the page_header output html' do
    it 'outputs the page_header html' do
    end
  end

  describe 'column structure' do
    context 'when the page header has a body passed in' do
      it 'has a 2 column layout' do

      end
    end

    context 'when page header does not have a body passed in' do
      it 'has a one column layout' do
      end
    end
  end

  describe 'the page title' do
    it 'outputs the page title' do
    end

    it 'includes the resource theme icon' do
    end

    describe 'page header subtitle' do
      context 'when a subtitle is present in options' do
        it 'outputs the subtitle' do
        end
      end

      context 'when a subtitle is not present in options' do
        it 'does not output the subtitle' do
        end
      end
    end
  end

  describe 'button toolbar' do
    context 'when the page header has a body in options' do
      it 'outputs the button toolbar' do
      end
    end

    context 'when the page header does not have a body in options' do
      it 'does not output the button toolbar' do
      end
    end
  end
end
