require 'rails_helper'

# Foundation callout component
RSpec.describe 'nfg_ui/email/_alert.html.inky-haml', type: :view do
  let(:theme_color) { nil }
  let(:body) { nil }
  subject { render partial: 'nfg_ui/email/alert', locals: { theme_color: theme_color, body: body } }

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
