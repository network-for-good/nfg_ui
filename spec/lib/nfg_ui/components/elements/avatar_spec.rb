require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::Avatar do
  let(:avatar) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Tooltipable utility module'

  describe '#alt' do
    let(:tested_option) { :alt }
    subject { avatar.alt }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#image' do
    let(:tested_option) { :image }
    subject { avatar.image }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#render' do
    let(:tested_href) { 'test_href' }
    let(:body_css_class) { avatar.send(:body_css_class) }
    let(:options ) {{}}
    let(:rendered_html) { avatar.render }

    subject { Capybara.string(rendered_html) }

    describe 'default rendering of the avatar' do
      subject { rendered_html }

      it 'renders a default avatar with no body elements' do
        expect(subject).to eq "<div class=\"avatar avatar-md\"></div>"
      end
    end

    context 'when rendering an avatar as a link by passing in an :href to :options' do
      let(:options) { { href: tested_href } }
      it 'renders the avatar as an <a> tag' do
        expect(subject).to have_css "a.avatar[href='#{tested_href}']"

        and_it 'does not render it as a div' do
          expect(subject).not_to have_css 'div.avatar'
        end
      end
    end

    context 'when rendering avatar not as a link by not passing in an :href to :options' do
      let(:options) { {} }

      it 'renders the avatar as a div' do
        expect(subject).to have_css "div.avatar"

        and_it 'does not render it as an <a> tag' do
          expect(subject).not_to have_css 'a.avatar'
        end

        and_it 'does not include an href attribute' do
          expect(subject).not_to have_css '.avatar[href]'
        end
      end
    end

    context 'when rendering an avatar with an image' do
      let(:tested_image) { "spec/fixtures/images/sample_image.jpg" }
      let(:options) { { image: tested_image } }

      it 'renders the avatar with the image' do
        expect(subject).to have_css ".avatar img[src*='#{tested_image}']"

        and_it 'does not render the avatar-text span' do
          expect(subject).not_to have_css body_css_class
        end
      end

      describe 'adding an alt to the image' do
        context 'and when an :alt is present in :options' do
          let(:tested_alt) { 'tested alt' }
          let(:options) { { image: tested_image, alt: tested_alt } }
          it 'supplies the alt to the image' do
            expect(subject).to have_css ".avatar img[alt='#{tested_alt}']"

            and_it 'does not add the alt to the .avatar parent element' do
              expect(subject).not_to have_css '.avatar[alt]'
            end
          end
        end

        context 'and when :alt is not present in options' do
          let(:options) { { image: tested_image } }
          it 'does not automatically generate an alt from the options' do
            expect(subject).not_to have_css '.avatar img[alt]'

            and_it 'does not add an alt to the parent div' do
              expect(subject).not_to have_css '.avatar[alt]'
            end
          end
        end
      end
    end

    context 'when rendering an avatar without an image' do
      let(:options) { {} }
      context 'and when rendering an avatar with a body' do
        let(:tested_body) { 'test body' }
        let(:options) { { body: tested_body } }
        it 'embraces the body within an avatar-text span' do
          expect(subject).to have_selector ".avatar .#{body_css_class}", text: tested_body
        end
      end

      context 'and when rendering an avatar without a body' do
        it 'does not include an avatar-text span' do
          expect(subject).not_to have_css ".avatar .#{body_css_class}"
        end
      end
    end

    describe 'tooltips on avatars' do
      context 'when adding a tooltip to the component' do
        let(:tested_tooltip) { 'test tooltip' }
        let(:options) { { tooltip: tested_tooltip } }
        it 'includes a tooltip' do
          expect(subject).to have_css ".avatar[data-toggle='tooltip'][title='#{tested_tooltip}']"
        end
      end

      context 'when not adding a tooltip to the component' do
        let(:options) { {} }
        it 'does not add the tooltip html attributes to the component' do
          expect(subject).not_to have_css ".avatar[data-toggle='tooltip'][title]"
        end
      end
    end

    describe 'sizing avatars' do
      let(:options) { { size: tested_size } }

      context 'when no size is supplied' do
        let(:options) { {} }
        it 'renders the avatar with medium size by default' do
          expect(subject).to have_css '.avatar.avatar-md'
        end
      end



      context 'when small size is supplied' do
        let(:tested_size) { :sm }
        it 'renders the avatar with the correct size' do
          expect(subject).to have_css '.avatar.avatar-sm'
        end
      end

      context 'when medium size is supplied' do
        let(:tested_size) { :md }
        it 'renders the avatar with the correct size' do
          expect(subject).to have_css '.avatar.avatar-md'
        end
      end

      context 'when large size is supplied' do
        let(:tested_size) { :lg }
        it 'renders the avatar with the correct size' do
          expect(subject).to have_css '.avatar.avatar-lg'
        end
      end

      context 'when xlarge size is supplied' do
        let(:tested_size) { :xl }
        it 'renders the avatar with the correct size' do
          expect(subject).to have_css '.avatar.avatar-xl'
        end
      end

      context 'when size is set to nil' do
        let(:tested_size) { nil }
        it 'renders the avatar with the default size' do
          expect(subject).to have_css '.avatar.avatar-md'
        end
      end

      context 'when size is an arbitrary / illegal value' do
        let(:tested_size) { :arbitrary }
        it 'renders the avatar with no size' do
          and_it 'does not render the avatar with the default size' do
            expect(subject).not_to have_css '.avatar.avatar-md'
          end

          and_it 'renders the avatar with no size' do
            expect(rendered_html).to eq "<div class=\"avatar\"></div>"
          end
        end
      end
    end
  end

  describe '#size' do
    let(:tested_option) { :size }
    subject { avatar.size }
    it_behaves_like 'an option with a value', fallback: :md

    context 'when the tested option is false in the :options hash' do
      let(:options) { { size: false } }
      it { is_expected.to eq :md }
    end
  end

  describe 'private themes' do
    describe '#body_css_class' do
      subject { avatar.send(:body_css_class) }
      it { is_expected.to eq 'avatar-text' }
    end

    describe '#default_html_wrapper_element' do
      subject { avatar.send(:default_html_wrapper_element) }
      it { is_expected.to eq :div }
    end

    describe '#default_size' do
      subject { avatar.send(:default_size) }
      it { is_expected.to eq :md }
    end

    describe '#non_html_attribute_options' do
      subject { avatar.send(:non_html_attribute_options) }
      it { is_expected.to include :image, :alt }
    end

    describe '#resized?' do
      subject { avatar.send(:resized?) }
      let(:options) { { size: tested_size } }
      context 'when the size supplied is a legal size' do
        context 'and when :sm' do
          let(:tested_size) { :sm }
          it { is_expected.to be }
        end

        context 'and when :md' do
          let(:tested_size) { :md }
          it { is_expected.to be }
        end

        context 'and when :lg' do
          let(:tested_size) { :lg }
          it { is_expected.to be }
        end

        context 'and when :xl' do
          let(:tested_size) { :xl }
          it { is_expected.to be }
        end

        context 'and when anything else' do
          let(:tested_size) { :arbitrary }
          it { is_expected.not_to be }
        end
      end
    end
  end
end
