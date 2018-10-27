require 'rails_helper'

RSpec.describe 'nfg_ui/foundations/icons/icon.html.haml', type: :view do
  let(:icon) { FactoryBot.create(:nfg_icon, *traits, **options) }
  let(:options) { {} }
  let(:traits) { [] }
  subject { render 'nfg_ui/foundations/icons/icon', icon: icon }

  pending 'Icon spec needed'

  describe 'the icon output html' do
    it 'outputs the icon html' do
    end
  end

  describe 'thematic icons' do
    context 'when theme is present in options' do
      it 'outputs an icon with a theme' do
      end
    end

    context 'when theme is not present in options' do
      it 'does not output an icon a theme' do
      end
    end
  end

  describe 'icons with text' do
    context 'when text is present' do
      it 'outputs text with the icon' do
      end
    end

    context 'when text is not present' do
      it 'does not output text with the icon' do
      end
    end
  end

  describe 'horizontal positioning of the icon' do
    context 'when the icon has :right as true in options' do
      it 'outputs text on the right of the icon' do
      end
    end
    context 'when the icon is not :right in options' do
      it 'does not output text on the right of the icon' do
      end
    end
  end
end
