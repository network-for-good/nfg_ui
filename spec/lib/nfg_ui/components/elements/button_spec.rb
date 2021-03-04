require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::Button do
  let(:button) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Bootstrap::Components::Button }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Iconable utility module'
  it_behaves_like 'a component that includes the Describable utility module'
  it_behaves_like 'a component that includes the Renderable utility module'

  it_behaves_like 'a component that includes the Size trait module'
  it_behaves_like 'a component that includes the Theme trait module'

  it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Traitable }

  describe '#render' do
    let(:rendered_html) { button.render }

    context 'when icon is passed' do
      let(:icon) { 'close' }
      let(:body) { nil }
      let(:options) {{ icon: icon, body: body }}

      context 'when body is blank and no block is used' do
        it "doesn't include an ml-1 class on the i tag" do
          expect(rendered_html).to eq "<a class=\"btn btn-primary\" href=\"#\"><i aria-hidden=\"true\" class=\"fa fa-#{icon}\"></i></a>"
        end
      end

      context 'when body is present' do
        let(:body) { 'Cancel' }

        it "includes an ml-1 class on the i tag" do
          expect(rendered_html).to eq "<a class=\"btn btn-primary\" href=\"#\">#{body}<i aria-hidden=\"true\" class=\"fa fa-#{icon} ml-1\"></i></a>"
        end
      end

      context 'when a block is used' do
        let(:rendered_html) { button.render { 'Block' }}

        it "includes an ml-1 class on the i tag" do
          expect(rendered_html).to eq "<a class=\"btn btn-primary\" href=\"#\">Block<i aria-hidden=\"true\" class=\"fa fa-#{icon} ml-1\"></i></a>"
        end
      end
    end
  end
end
