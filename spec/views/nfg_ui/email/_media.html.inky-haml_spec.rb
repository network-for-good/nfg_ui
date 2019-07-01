require 'rails_helper'

# Foundation callout component
RSpec.describe 'nfg_ui/email/_media.html.inky-haml', type: :view do
  let(:body) { nil }
  let(:image) { nil }
  let(:test_image_alt) { nil }

  subject { render partial: 'nfg_ui/email/media', locals: { body: body, image: image, image_alt: test_image_alt } }

  context 'when :image is present in locals' do
    let(:image_filename) { 'sample_image' }
    let(:image) { "#{NfgUi::Engine.root}/spec/fixtures/images/#{image_filename}.jpg" }

    it 'creates a two column layout' do
      expect(subject).to have_css "th[class*='small']", count: 2

      expect(subject).to have_css '.small-2'
      expect(subject).to have_css '.small-10'

      and_it 'does not create a one column layout' do
        expect(subject).not_to have_css '.small-12'
      end
    end

    it 'renders the image' do
      expect(subject).to have_css "img[src*='#{image_filename}']"
    end

    context 'when the :image_alt is present in locals' do
      let(:test_image_alt) { 'test image alt' }

      it 'applies the local_assigns :image_alt as the images alt content' do
        expect(subject).to have_css "img[alt='#{test_image_alt}']"
      end
    end

    context 'when the :image_alt is not present in locals' do
      let(:image_alt) { nil }
      it 'namifies the filename of the image and supplies that as the alt' do
        expect(subject).to have_css "img[alt='Sample Image']"
      end
    end
  end

  context 'when :image is not present in locals' do
    it 'creates a one column layout' do
      expect(subject).to have_css '.small-12'
      expect(subject).to have_css "th[class*='small']", count: 1

      and_it 'does not create a two column layout' do
        expect(subject).not_to have_css '.small-2'
        expect(subject).not_to have_css '.small-10'
      end
    end

    it 'does not render an image' do
      expect(subject).not_to have_css 'img'
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
        render layout: 'nfg_ui/email/media' do
          body
        end
      end
      it 'renders the captured body content' do
        expect(subject).to have_text body
      end
    end
  end
end
