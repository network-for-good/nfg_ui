require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_collapse.html.haml', type: :view do
  let(:collapse) { FactoryBot.create(:bootstrap_collapse, **options) }
  let(:options) { {} }

  subject { render 'nfg_ui/bootstrap/collapse', collapse: collapse }

  pending 'needs spec updates'

  it 'outputs a collapse html' do
    "<div class='collapse' id='collapse_id'>\n\n</div>\n"
  end

  describe 'a navbar collapse' do
    context 'when navbar is true in options' do
      let(:options) { { navbar: true } }
      # it { is_expected.to eq "<div class='collapse show navbar-collapse' id='collapse_id'>\n\n</div>\n" }
    end

    context 'when navbar is not true in options' do
      it { is_expected.not_to have_css '.navbar-collapse' }
    end
  end
end
