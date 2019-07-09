require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Form do
  let(:form) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  it_behaves_like 'a component with a consistent initalized construction'

  describe '#render' do
    let(:rendered_html) { form.render }
    let(:options) { { body: body } }
    let(:body) { 'test body' }
    subject { Capybara.string(rendered_html) }

    it 'outputs a bootstrap form component in html' do
      expect(subject).to have_css '.form'
      expect(subject).to have_selector '.form', text: body
      expect(rendered_html).to eq "<div class=\"form\">#{body}</div>"
    end
  end
end
