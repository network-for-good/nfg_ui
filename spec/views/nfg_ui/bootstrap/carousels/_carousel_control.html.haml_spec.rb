require "rails_helper"

RSpec.describe "nfg_ui/bootstrap/carousels/_carousel_control.html.haml", type: :view do
  let(:carousel_control) { FactoryBot.create(:bootstrap_carousel_control, **options) }
  let(:options) { {} }
  subject { carousel_control.render }

  describe "html output for the bootstrap carousel-control" do
    it "outputs a bootstrap carousel-control component in html" do
      expect(subject).to have_selector ".carousel-control"
      expect(subject).to eq '<a class="carousel-control" href="#" role="button"></a>'
    end
  end

  describe "a carousel control with controls set" do
    context "when control is set in options" do
      describe "a properly setup carousel control" do
        let(:tested_control) { :prev }
        let(:tested_carousel) { "#test_carousel" }
        let(:options) { { control: tested_control, carousel: tested_carousel } }

        it "outputs a link with the intended control in place" do
          expect(subject).to have_css "a.carousel-control-#{tested_control}[data-slide=#{tested_control}]"
          expect(subject).to have_css ".carousel-control-#{tested_control}-icon"
          expect(subject).to eq "<a class=\"carousel-control-#{tested_control}\" data-slide=\"prev\" href=\"#{tested_carousel}\" role=\"button\"><span class=\"carousel-control-#{tested_control}-icon\" aria-hidden=\"true\"></span><span class=\"sr-only\">#{tested_control.to_s}</span></a>"
        end
      end
    end

    context "when a control is not set in options" do
      let(:options) { {} }
      it "does not implement a direction specific control" do
        expect(subject).to eq '<a class="carousel-control" href="#" role="button"></a>'
      end
    end
  end

  describe "identifying the target carousel to control" do
    context "when a carousel is identified in options" do
      let(:tested_carousel) { "#tested_carousel" }
      let(:options) { { carousel: tested_carousel } }
      it "connects the control to the carousel" do
        expect(subject).to have_css "a[href=\"#{tested_carousel}\"]"
        expect(subject).to eq "<a class=\"carousel-control\" href=\"#{tested_carousel}\" role=\"button\"></a>"
      end
    end

    context "when a carousel is not identified in options" do
      it "outputs the control with a fallback href" do
        expect(subject).to have_css 'a[href="#"]'
        expect(subject).to eq '<a class="carousel-control" href="#" role="button"></a>'
      end
    end
  end
end
