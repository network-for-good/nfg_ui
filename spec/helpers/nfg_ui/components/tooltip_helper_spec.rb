require 'rails_helper'
# require 'browser'

RSpec.describe NfgUi::Components::TooltipHelper do
  describe '#tooltip(tooltip_content, placement = :top, data = {})' do
    let(:placement_arg) { :top }
    let(:output_hash) { { title: 'Tooltip Text', data: { placement: placement_arg, toggle: 'tooltip', html: 'true' } } }
    let(:browser_is_a_touch_device) { false }

    before { allow(helper).to receive(:browser_is_a_touch_device?).and_return(browser_is_a_touch_device) }

    subject { helper.tooltip("Tooltip Text", placement_arg) }

    context "when placement is not set, it should default to :top" do
      subject { helper.tooltip("Tooltip Text" ) }
      it { is_expected.to eql output_hash }
    end

    context "when placement is set to an acceptable direction" do
      %i[right top bottom left].each do | direction |
        let(:placement_arg) { direction }
        it { is_expected.to eql output_hash }
      end
    end

    context "when placement is set to an unacceptable direction" do
      let(:placement_arg) { :random }

      it "should raise an error indicating the acceptable directions and communicate what placement direction you passed in" do
        expect{ subject }.to raise_error(StandardError)
      end
    end

    context "device is a touch device" do
      require 'browser'
      before { allow(helper).to receive(:browser_is_a_touch_device?).and_return(browser_is_a_touch_device) }
      let(:browser_is_a_touch_device) { true }
      it { is_expected.to eq({}) }
    end
  end
end
