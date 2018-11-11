require 'rails_helper'

RSpec.describe 'nfg_ui/elements/alerts/_alert.html.haml', type: :view do
  let(:alert) { FactoryBot.create(:alert, traits: traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { render 'nfg_ui/elements/alerts/alert', alert: alert }

  describe 'the alert html component' do
    it 'renders the bootstrap alert' do
      expect(subject).to render_template(partial: 'nfg_ui/bootstrap/_alert')
    end
  end
end
