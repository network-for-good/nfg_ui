require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::ButtonToolbar do
  let(:button_toolbar) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe '#component_css_class' do
    subject { button_toolbar.send(:component_css_class) }
    it { is_expected.to eq 'btn-toolbar' }
  end

  describe '#render' do
    let(:rendered_html) { button_toolbar.render }
    subject { Capybara.string(rendered_html) }

    describe 'html output for the bootstrap button_toolbar' do
      let(:options) { { body: body } }
      let(:body) { 'test body content' }

      it 'outputs a bootstrap button_toolbar component in html' do
        expect(subject).to have_css '.btn-toolbar'
        expect(subject).to have_selector '.btn-toolbar', text: body
        expect(rendered_html).to eq "<div class=\"btn-toolbar\" role=\"toolbar\">#{body}</div>"
      end
    end
  end

  describe 'private methods' do
    describe '#assistive_html_attributes' do
      subject { button_toolbar.send(:assistive_html_attributes) }
      it { is_expected.to eq(role: 'toolbar') }
    end
  end
end
