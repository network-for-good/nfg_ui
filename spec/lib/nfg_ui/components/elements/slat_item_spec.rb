require 'rails_helper'

RSpec.describe NfgUi::Components::Elements::SlatItem do
  let(:slat_item) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'

  it_behaves_like 'a component that includes the Headable utility module', component_suite: :nfg

  it_behaves_like 'a component that includes the Sizable utility module', component_suite: :nfg, skip: :sm

  it_behaves_like 'a component that includes the Size trait module'

  describe '#slat_header' do
    let(:tested_option) { :slat_header }
    subject { slat_item.slat_header }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#caption' do
    let(:tested_option) { :caption }
    subject { slat_item.caption }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#render' do
    let(:rendered_html) { slat_item.render }
    subject { Capybara.string(rendered_html) }

    it 'renders a basic component' do
      expect(rendered_html).to eq "<div class=\"slat-item\"></div>"
    end

    describe 'slat_header' do
      let(:options) { { slat_header: tested_slat_header, tooltip: tested_tooltip } }
      let(:tested_tooltip) { nil }

      context 'when slat_header is present' do
        let(:tested_slat_header) { 'Tested slat header' }
        it 'includes the slat header' do
          expect(rendered_html).to eq "<div class=\"slat-item\"><h6 class=\"display-4 slat-column-header\">#{tested_slat_header}</h6></div>"

          expect(subject).to have_css '.slat-item h6.display-4.slat-column-header'
        end

        describe 'tooltip presence in options' do
          context 'when tooltip is present' do
            let(:tested_tooltip) { 'tooltip' }
            it 'includes the tooltip on the slat column header' do
              expect(rendered_html).to eq "<div class=\"slat-item\"><h6 class=\"display-4 slat-column-header\" title=\"#{tested_tooltip}\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\">#{tested_slat_header}</h6></div>"
              expect(subject).to have_css "[data-toggle='tooltip']"

            end
          end

          context 'when tooltip is not present' do
            let(:tested_tooltip) { nil }
            it 'does not include tooltip markup in the HTML' do
              expect(subject).not_to have_css "[data-toggle='tooltip']"
            end
          end
        end
      end

      context 'when slat_header is not present' do
        let(:tested_slat_header) { nil }
        it 'does not include the slat header' do
          expect(subject).not_to have_css '.slat-item h6.display-4.slat-column-header'
        end
      end
    end

    describe 'heading' do
      let(:options) { { heading: tested_heading, href: tested_href, tooltip: tested_tooltip } }
      let(:tested_heading) { nil }
      let(:tested_href) { nil }
      let(:tested_tooltip) { nil }

      context 'when heading is present' do
        let(:tested_heading) { 'Tested heading' }

        context 'and when href is present' do
          let(:tested_href) { 'http://website.com' }
          it 'renders the heading within a link' do
            expect(subject).to have_css '.slat-item h6'
            expect(rendered_html).to eq "<div class=\"slat-item\"><a href=\"#{tested_href}\"><h6>#{tested_heading}</h6></a></div>"
          end

        end

        context 'and when href is not present' do
          it 'renders the heading without a link' do
            expect(rendered_html).to eq "<div class=\"slat-item\"><h6>#{tested_heading}</h6></div>"
            expect(subject).to have_css '.slat-item h6'
          end
        end

        describe 'tooltip on the heading' do
          context 'when tooltip is present' do
            let(:tested_tooltip) { 'tested tooltip' }
            it 'applies the tooltip on the heading only' do
              expect(rendered_html).to eq "<div class=\"slat-item\"><h6 data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\">#{tested_heading}</h6></div>"

              expect(subject).to have_css "h6[data-toggle='tooltip']"
            end
          end

          context 'when tooltip is not present' do
            let(:tested_tooltip) { nil }

            it 'does not add tooltip markup to the heading' do
              expect(subject).not_to have_css "h6[data-toggle='tooltip']"
            end
          end
        end
      end

      context 'when heading is not present' do
        it 'does not render a heading' do
          expect(subject).not_to have_css '.slat-item h6'
        end
      end
    end

    describe 'rendering the body' do
      let(:options) { { body: tested_body, tooltip: tested_tooltip } }
      let(:tested_body) { 'tested body' }
      let(:tested_tooltip) { nil }

      it 'renders the body' do
        expect(rendered_html).to eq "<div class=\"slat-item\">#{tested_body}</div>"
      end

      describe 'tooltip presence on body' do
        context 'when a tooltip is present' do
          let(:tested_tooltip) { 'tested tooltip' }
          it 'adds a tooltip to the slat item' do
            expect(rendered_html).to eq "<div class=\"slat-item\" title=\"#{tested_tooltip}\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\">#{tested_body}</div>"
            expect(subject).to have_css ".slat-item[data-toggle='tooltip']"
          end
        end

        context 'when a tooltip is not present' do
          let(:tested_tooltip) { nil }
          it 'does not add a tooltip markup html to the slat item' do
            expect(subject).not_to have_css ".slat-item[data-toggle='tooltip']"
          end
        end
      end
    end

    describe 'caption' do
      let(:options) { { caption: tested_caption, tooltip: tested_tooltip } }
      let(:tested_tooltip) { nil }

      context 'when caption is present' do
        let(:tested_caption) { 'tested caption' }
        it 'renders the slat item with a caption' do
          expect(rendered_html).to eq "<div class=\"slat-item\"><p class=\"mb-0 font-size-sm\">#{tested_caption}</p></div>"

          expect(subject).to have_css '.slat-item p.mb-0.font-size-sm'
        end

        describe 'tooltip presence on caption slat item' do
          context 'when tooltip is present' do
            let(:tested_tooltip) { 'tested tooltip' }
            it 'adds a tooltip to the caption' do
              expect(rendered_html).to eq "<div class=\"slat-item\"><p class=\"mb-0 font-size-sm\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\">#{tested_caption}</p></div>"

              expect(subject).to have_css ".font-size-sm[data-toggle='tooltip']"
            end
          end

          context 'when tooltip is not present' do
            let(:tested_tooltip) { nil }
            it 'does not add the tooltip html to the caption markup' do
              expect(subject).not_to have_css ".font-size-sm[data-toggle='tooltip']"
            end
          end
        end
      end

      context 'when caption is not present' do
        let(:tested_caption) { nil }
        it 'does not render the slat item with a caption' do
          expect(subject).not_to have_css '.slat-item p.mb-0.font-size-sm'
        end
      end
    end

    describe 'complex tooltip implementations' do
      let(:options) { { heading: tested_heading, body: tested_body, caption: tested_caption, tooltip: tested_tooltip } }
      let(:tested_tooltip) { 'tested tooltip' }
      let(:tested_heading) { nil }
      let(:tested_body) { nil }
      let(:tested_caption) { nil }

      describe 'heading as the anchored element' do
        context 'when heading, body and caption are present' do
          let(:tested_heading) { 'tested heading' }
          let(:tested_body) { 'tested body' }
          let(:tested_caption) { 'tested caption' }

          it 'adds a tooltip to the heading only' do
            expect(rendered_html).to eq "<div class=\"slat-item\"><h6 data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\">#{tested_heading}</h6>#{tested_body}<p class=\"mb-0 font-size-sm\">#{tested_caption}</p></div>"
          end
        end

        context 'when heading and caption are present' do
          let(:tested_heading) { 'tested heading' }
          let(:tested_caption) { 'tested caption' }
          it 'adds a tooltip to the heading only' do
            expect(rendered_html).to eq "<div class=\"slat-item\"><h6 data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\">#{tested_heading}</h6><p class=\"mb-0 font-size-sm\">#{tested_caption}</p></div>"
          end
        end

        context 'when heading and body are present' do
          let(:tested_heading) { 'tested heading' }
          let(:tested_body) { 'tested body' }
          it 'adds a tooltip to the heading only' do
            expect(rendered_html).to eq "<div class=\"slat-item\"><h6 data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\">#{tested_heading}</h6>#{tested_body}</div>"
          end
        end
      end

      describe 'caption as the anchored element' do
        context 'when caption and body are present' do
          let(:tested_caption) { 'tested caption' }
          let(:tested_body) { 'tested body' }

          it 'adds a tooltip to the caption' do
            expect(rendered_html).to eq "<div class=\"slat-item\">#{tested_body}<p class=\"mb-0 font-size-sm\" data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" title=\"#{tested_tooltip}\">#{tested_caption}</p></div>"
          end
        end
      end
    end
  end

  describe 'private methods' do
    describe '#resized?' do
      subject { slat_item.send(:resized?) }
      let(:options) { { size: size } }

      context 'when the symbol is included in the array' do
        context 'when it is :sm' do
          let(:size) { :md }
          it { is_expected.to be }
        end

        context 'when it is :lg' do
          let(:size) { :lg }
          it { is_expected.to be }
        end

        context 'when it is :none' do
          let(:size) { :xl }
          it { is_expected.to be }
        end

      end

      context 'when the symbol is not included in the array' do
        let(:size) { :arbitrary }
        it { is_expected.to be_falsy }
      end
    end
  end
end
