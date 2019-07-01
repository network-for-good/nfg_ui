require 'rails_helper'

# Foundation callout component
RSpec.describe 'nfg_ui/email/_alert.html.inky-haml', type: :view do
  let(:theme_color) { nil }
  let(:body) { nil }
  let(:image) { nil }
  let(:test_image_alt) { nil }
  subject { render partial: 'nfg_ui/email/alert', locals: { theme_color: theme_color, body: body, image: image, image_alt: test_image_alt } }

  describe 'applying the :theme_color' do
    context 'when theme_color is present' do
      let(:theme_color) { :success }
      it 'applies the theme color to the "callout" (foundation email term) / "alert" component' do
        expect(subject).to have_css "table.callout .#{theme_color}"
      end
    end

    context 'when theme_color is nil' do
      let(:theme_color) { nil }
      it 'does not apply a theme color' do
        # This string indicates that no theme color was applied
        expect(subject).to include "<table class=\"callout\"><tr>\n<th class=\"callout-inner\">\n<table class=\"row\">"
      end
    end
  end

  describe 'an alert with an :image' do
    let(:success_fallback_image_filename) { 'fa-check-circle-success' }
    let(:success_fallback_image_string) { "nfg_ui/email/icons/#{success_fallback_image_filename}.png" }

    context 'when :image is present in locals' do
      let(:image_filename) { 'sample_image' }
      let(:image) { "#{NfgUi::Engine.root}/spec/fixtures/images/#{image_filename}.jpg" }

      context 'when :image_alt is present in locals' do
        let(:test_image_alt) { 'test alt' }
        it 'adds the image alt to the image through the media component' do
          expect(subject).to have_css "img[alt='#{test_image_alt}']"
        end
      end

      context 'when theme_color is :success in locals' do
        let(:theme_color) { :success }
        it 'leverages the local_assigns :image string for the image' do
          expect(subject).to have_css "img[src*='#{image_filename}']"

          and_it 'does not use the fallback image string' do
            expect(subject).not_to have_css "img[src*='#{success_fallback_image_filename}']"
          end
        end
      end

      context 'when theme_color is not :success in locals' do
        let(:theme_color) { :warning }
        it 'leverages the local_assigns :image string for the image' do
          expect(subject).to have_css "img[src*='#{image_filename}']"

          and_it 'does not use the fallback image string' do
            expect(subject).not_to have_css "img[src*='#{success_fallback_image_filename}']"
          end
        end
      end
    end

    context 'when :image is not present in locals' do
      let(:image) { nil }
      context 'when theme_color is :success in locals' do
        let(:theme_color) { :success }
        it 'renders the media component and uses the fallback image' do
          expect(subject).to have_css "img[src*='#{success_fallback_image_filename}']"
        end
      end

      context 'when theme_color is not :success in locals' do
        let(:theme_color) { :warning }
        it 'does not render the media component nor any image' do
          expect(subject).not_to have_css 'img'
        end
      end
    end
  end

  describe 'rendering the component with body content' do
    let(:body) { 'Test body' }
    context 'when :body is passed in as a local' do
      it 'renders the local_assigns :body content' do
        expect(subject).to have_text body
      end
    end

    context 'when :body is passed in as a block' do
      subject do
        render layout: 'nfg_ui/email/alert' do
          body
        end
      end
      it 'renders the captured body content' do
        expect(subject).to have_text body
      end
    end
  end
end
