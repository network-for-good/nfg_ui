require 'rails_helper'

RSpec.describe 'nfg_ui/bootstrap/_alert.html.haml', type: :view do
  let(:alert) { FactoryBot.create(:bootstrap_alert) }
  subject { render partial: 'nfg_ui/bootstrap/alert', alert: alert }
  # subject { view_context.ui.nfg :alert }

  it { raise alert.inspect }
end
