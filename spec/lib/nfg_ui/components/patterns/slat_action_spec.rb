require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::SlatActions do
  let(:slat_action) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  let(:rendered) { slat_action.render }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  describe 'render' do
    subject { Capybara.string(rendered) }

    context "when there is an href present in the options" do
      context 'when the method is delete' do
        let(:options) { { wide: false, menu: false, href: "path/to/item", method: :delete, confirm: "Are you sure you want to delete this item?", title: "Delete item" } }

        it 'should add a data-method option to the created url and set it to "delete"' do
          expect(subject).to have_css(".slat-actions a[data-method='delete'][href='path/to/item']")
        end
      end

      context "when the method is other than delete" do
        let(:options) { { menu: false, method: :put, href: "path/to/item", } }

        it 'adds the method directly to the link' do
          expect(subject).to have_css(".slat-actions a[method='put']")
        end
      end
    end
  end
end
