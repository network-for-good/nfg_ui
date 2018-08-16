require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Utilities::Collapsible do
  # Collapse is collapsible
  let(:collapse) { FactoryBot.create(:bootstrap_collapse, **options) }
  let(:options) { {} }
  let(:tested_collapsed) { nil }
  let(:tested_collapsible) { nil } 

  describe '#collapsed' do
    let(:collapsed) { tested_collapsed }
    let(:collapsible) { tested_collapsible }
    
  end
end
