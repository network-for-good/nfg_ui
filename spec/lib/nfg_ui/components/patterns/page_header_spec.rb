require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::PageHeader do
  let(:view_context) { ActionController::Base.new.view_context }
  let(:page_header) { described_class.new(options, view_context) }
  let(:options) { {} }

  describe 'shared modules' do
    it { expect(described_class).to be < NfgUi::Components::Base }
    it_behaves_like 'a component with a consistent initalized construction'
    it_behaves_like 'a component that includes the Titleable utility module'
    it_behaves_like 'a component that includes the Iconable utility module'
    it_behaves_like 'a component that includes the Renderable utility module'
    it_behaves_like 'a component that includes the Titleable utility module'

    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::BrowserDetectable }
    it { expect(described_class.included_modules).to include NfgUi::Components::Traits::PageHeader }
    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::ResourceThemeable }
  end

  # Due to the browser and Rails.env.test conditions,
  # The shared utility module examples will fail when dealing with view_context
  # So these tests are isolated into their own describe block so
  # we can manage the #before manipulations without hampering
  # the shared examples tests for the included modules
  describe 'methods impacted by rails environments and Browser gem' do
    let(:is_mobile) { false }
    let(:is_test_environment) { false }
    # Bypass sticky's auto return on test environments and mobile
    before do
      allow(view_context).to receive_message_chain(:request, :user_agent).and_return('some-agent')
      allow_any_instance_of(Browser::Device).to receive(:mobile?).and_return(is_mobile)
      allow(Rails.env).to receive(:test?).and_return(is_test_environment)
    end

    describe '#data' do
      subject { page_header.data }
      let(:is_mobile) { false }
      let(:is_test_environment) { false }
      let(:sticky_tested_hash_key_and_value) { { toggle: 'sticky-div' } }

      context 'when :sticky is true' do
        let(:options) { { sticky: true } }

        it 'updates the data attribute to use the sticky div toggle' do
          expect(subject).to include(sticky_tested_hash_key_and_value)
        end

        context 'and when data includes additional values in its hash' do
          let(:test_key) { 'test-key' }
          let(:test_value) { 'test-value' }
          let(:options) { { sticky: true, data: { test_key => test_value } } }
          it 'adds the data toggle to the existing hash values' do
            expect(subject).to include({ test_key => test_value, **sticky_tested_hash_key_and_value })
          end
        end
      end

      context 'when :sticky is false' do
        let(:options) { { sticky: false } }
        it 'does not add the sticky-div data toggle to the data attribute' do
          expect(subject).not_to include(sticky_tested_hash_key_and_value)
        end
      end
    end

    describe '#sticky' do
      subject { page_header.sticky }

      context 'when rails environment is set to test' do
        let(:is_test_environment) { true }
        it { is_expected.to be_falsy }
      end

      context 'when rails environment is not set to test' do
        context 'when browser is mobile' do
          let(:is_mobile) { true }
          it { is_expected.to be_falsy }
        end

        context 'and when browser is not mobile' do
          let(:tested_option) { :sticky }
          let(:is_mobile) { false }
          it_behaves_like 'a fetched option with a defined fallback', fallback: true
        end
      end
    end
  end

  describe '#full_width' do
    let(:tested_option) { :full_width }
    subject { page_header.full_width }
    it_behaves_like 'a fetched option with a defined fallback', fallback: false
  end

  describe '#subtitle' do
    let(:tested_option) { :subtitle }
    subject { page_header.subtitle }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#resource_theme_icon' do
    let(:options) { { icon: tested_icon } }

    subject { page_header.resource_theme_icon }

    context 'when an :icon is present in options' do
      let(:tested_icon) { 'tester' }
      it 'uses the supplied icon' do
        expect(subject).to eq tested_icon
      end
    end

    context 'when an :icon is not present in options' do
      let(:tested_icon) { nil }
      it 'uses the super / fallback icon' do
        expect(subject).to eq NfgUi::Components::Utilities::ResourceThemeable::FALLBACK_ICON
      end
    end
  end

  describe '#render' do
    let(:rendered_html) { page_header.render }
    subject { Capybara.string(rendered_html) }

    describe 'the page_header with no options' do
      let(:options) { {} }
      it 'outputs the expected HTML' do
        expect(rendered_html).to eq "<div class=\"page-header container-fluid\"><div class=\"row\"><div class=\"col col-xl-11 mx-auto\"><div class=\"row align-items-center\"><div class=\"col py-2\"><div class=\"media\"><div class=\"mr-2 h2\"><i aria-hidden=\"true\" class=\"fa fa-#{NfgUi::Components::Utilities::ResourceThemeable::FALLBACK_ICON} text-#{NfgUi::Components::Utilities::ResourceThemeable::DEFAULT_THEME_COLOR} mr-0\"></i></div><div class=\"media-body\"><h2></h2></div></div></div></div></div></div></div>"
      end
    end

    describe 'the page_header with a subtitle' do
      let(:tested_subtitle) { 'tested subtitle' }
      let(:options) { { subtitle: tested_subtitle } }

      it 'renders the subtitle with the correct html' do
        expect(rendered_html).to include "<h2><span class=\"mr-2\"></span><small class=\"text-muted\">#{tested_subtitle}</small></h2>"
      end
    end

    describe 'page_header with an included body' do
      let(:tested_body) { nil }
      let(:options) { { body: tested_body } }

      context 'when the page_header includes a body' do
        let(:tested_body) { 'tested body' }
        it 'includes the coded html body portion of the page_header' do
          expect(rendered_html).to include "<div class=\"col-12 col-md-auto py-2\"><div class=\"btn-toolbar align-items-center\" role=\"toolbar\">#{tested_body}</div>"
          expect(subject).to have_css '.btn-toolbar.align-items-center'
        end
      end

      context 'and when the page_header does not include a body' do
        let(:tested_body) { nil }
        it 'does not include the html body portion of the page_header' do
          expect(subject).not_to have_css '.btn-toolbar.align-items-center'
        end
      end
    end
  end

  describe 'private methods' do
    describe '#column_structure_css_classes' do
      let(:options) { { full_width: tested_full_width } }

      subject { page_header.send(:column_structure_css_classes) }

      context 'when full_width is true' do
        let(:tested_full_width) { true }
        it 'does not supply modifier css classes' do
          expect(subject).to eq 'col'
        end
      end

      context 'when full_width is false' do
        let(:tested_full_width) { false }
        it 'supplies modifier css classes' do
          expect(subject).to eq 'col col-xl-11 mx-auto'
        end
      end
    end

    describe '#non_html_attribute_options' do
      subject { page_header.send(:non_html_attribute_options) }

      it { is_expected.to include(:subtitle, :full_width, :sticky) }
    end
  end
end
