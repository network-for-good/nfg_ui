require 'rails_helper'

RSpec.describe NfgUi::Components::Utilities::ResourceThemeable do
  # Page header is resource themeable
  let(:page_header) { FactoryBot.create(:page_header, *traits, **options) }
  let(:traits) { [] }
  let(:options) { {} }

  pending 'ResourceThemeable specs needed'

  describe '#resource_theme_color(object = nil)' do
    let(:object) { {} }
    subject { page_header.resource_theme_color(object) }
  end

  describe '#resource_theme_name(object = nil)' do
    let(:object) { {} }
    subject { page_header.resource_theme_name }
  end

  describe '#resource_theme_icon(object = nil)' do
    let(:object) { {} }
    subject { page_header.resource_theme_icon }
  end
end
