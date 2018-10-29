require 'rails_helper'

RSpec.describe 'Modal interactions', type: :feature, js: true do
  before { visit modals_index_path }
  pending 'Modal interactions are pending finalization of components and buttons'

  describe 'turning a modal on' do
    context 'turning a modal on from a button' do
    end

    context 'turning a modal on from a link' do
    end
  end

  describe 'dismissing a modal' do
    context 'dismissing a modal with a footer close button' do
    end

    context 'dismissing a modal from the modal header close button' do
    end
  end

  describe 'tooltips behavior when a modal is present' do
    context 'when a tooltip is present on the data-toggle modal button' do
    end

    context 'when a tooltip is present on the data-modal' do
    end

    context 'dismissing a modal that has an active tooltip within the modal body' do
    end
  end
end
