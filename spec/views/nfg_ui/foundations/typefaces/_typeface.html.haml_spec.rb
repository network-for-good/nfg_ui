require 'rails_helper'

RSpec.describe 'nfg_ui/foundations/typefaces/_typeface.html.haml', type: :view do
  let(:typeface) { FactoryBot.create(:typeface, *traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { typeface.render }

  pending 'Typeface spec needed'

  it { is_expected.to have_css typeface.send(:default_html_wrapper_element) }

  describe 'typeface output html' do
    it 'outputs the typeface component in html' do
    end
  end

  describe 'typeface heading' do
    context 'when heading is present in the options' do
      it 'outputs the heading typeface' do
      end
    end

    context 'when title is present in the options' do
      it 'outputs the title typeface' do
      end
    end

    context 'when body is present in the options' do
      it 'outputs the body typeface' do
      end
    end
  end

  describe 'thematic typeface' do
    context 'when theme is present in typeface options' do
      it 'applies the theme to the typeface html' do
      end
    end

    context 'when theme is not present in typeface options' do
      it 'does not apply the theme to the typeface html' do
      end
    end

    context 'when theme is present in traits' do
      it 'applies the theme to the typeface html' do
      end
    end
  end
end
