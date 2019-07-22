require 'rails_helper'

RSpec.describe NfgUi::Bootstrap::Components::Table do
  let(:table) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }

  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Base }

  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Responsiveable utility module', component_suite: :bootstrap
  it_behaves_like 'a component that includes the Sizable utility module', component_suite: :bootstrap

  describe '#render' do
    let(:rendered_component) { table.render }
    subject { Capybara.string(rendered_component) }

    describe 'responsive table' do
      let(:options) { { responsive: tested_responsive } }
      let(:tested_responsive) { nil }

      context 'when :responsive is true in :options' do
        let(:tested_responsive) { true }
        it 'renders the table in in a parent responsive div' do
          expect(subject).to have_css 'div.table-responsive table'

          and_it 'does not add the responsive table css class to the table' do
            expect(subject).not_to have_css 'table.table-responsive'
            expect(rendered_component).to eq "<div class=\"table-responsive\"><table class=\"table \"></table></div>"
          end
        end
      end

      context 'when :reponsive is false in :options' do
        let(:tested_responsive) { false }
        it 'does not render the table in a parent responsive div' do
          expect(subject).not_to have_css 'div.table-responsive table'

          and_it 'renders the table' do
            expect(rendered_component).to eq "<table class=\"table\"></table>"
          end
        end
      end
    end

    describe 'a bordered table' do
      let(:options) { { bordered: tested_bordered } }
      let(:tested_bordered) { nil }

      context 'when :bordered is true in :options' do
        let(:tested_bordered) { true }
        it 'renders the table with the bordered css class' do
          expect(subject).to have_css '.table-bordered'
        end
      end

      context 'when :bordered is false in :options' do
        let(:tested_bordered) { false }

        it 'renders the table without the bordered css class' do
          expect(subject).not_to have_css '.table-bordered'

          and_it 'renders the correct, default table HTML' do
            expect(rendered_component).to eq "<table class=\"table\"></table>"
          end
        end
      end
    end

    describe 'a striped table' do
      let(:options) { { striped: tested_striped } }
      let(:tested_striped) { nil }

      context 'when :striped is true in :options' do
        let(:tested_striped) { true }
        it 'renders the table with the striped css class' do
          expect(subject).to have_css '.table-striped'
        end
      end

      context 'when :striped is false in :options' do
        let(:tested_striped) { false }

        it 'renders the table without the striped css class' do
          expect(subject).not_to have_css '.table-striped'

          and_it 'renders the correct, default table HTML' do
            expect(rendered_component).to eq "<table class=\"table\"></table>"
          end
        end
      end
    end
  end
end
