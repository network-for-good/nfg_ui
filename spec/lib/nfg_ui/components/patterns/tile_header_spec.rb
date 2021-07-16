require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::TileHeader do
  let(:tile_header) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Collapsible utility module'
  it_behaves_like 'a component that includes the Iconable utility module'
  it_behaves_like 'a component that includes the Titleable utility module'

  describe '#component_family' do
    subject { tile_header.component_family }
    it { is_expected.to eq :tile }
  end

  describe '#subtitle' do
    subject { tile_header.subtitle }
    let(:tested_option) { :subtitle }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#button' do
    subject { tile_header.button }
    let(:tested_option) { :button }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#href' do
    subject { tile_header.href }
    let(:tested_option) { :href }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#render' do
    let(:rendered_html) { tile_header.render }
    let(:additional_options) { {} }
    let(:options) { { title: tested_title, **additional_options } }

    subject { Capybara.string(rendered_html) }

    context 'when :title is present in options' do
      let(:tested_title) { 'tested title' }

      it 'renders the title' do
        expect(rendered_html).to eq "<div class=\"tile-header\"><div class=\"row\"><div class=\"col\"><div class=\"row\"><div class=\"col-12 col-md\"><h5 class=\"h4\">#{tested_title}</h5></div></div></div></div></div>"
      end

      describe 'an icon in the tileheader' do
        let(:additional_options) { { icon: tested_icon } }
        context 'and when an :icon is included in the options' do
          let(:tested_icon) { 'rocket' }
          it 'adds an icon to the header' do
            expect(subject).to have_css ".tile-header .h4 .fa.fa-#{tested_icon}"
          end
        end

        context 'and when an icon is not included in the options' do
          let(:tested_icon) { nil }
          it 'does not add an icon to the header' do
            expect(subject).not_to have_css '.fa'
          end
        end
      end

      describe 'a :subtitle in the TileHeader' do
        let(:additional_options) { { subtitle: tested_subtitle } }

        context 'and when a :subtitle is in the TileHeader' do
          let(:tested_subtitle) { 'tested subtitle' }
          it 'includes a subtitle in the tile header' do
            expect(rendered_html).to eq "<div class=\"tile-header\"><div class=\"row\"><div class=\"col\"><div class=\"row\"><div class=\"col-12 col-md\"><h5 class=\"h4\">#{tested_title}</h5><p class=\"mt-1 mb-0 text-muted\">#{tested_subtitle}</p></div></div></div></div></div>"
            expect(subject).to have_css 'h5 + p.text-muted'
          end
        end

        context 'and when a :subtitle is not in the TileHeader' do
          let(:tested_subtitle) { nil }
          it 'does not include the subtitle' do
            expect(subject).not_to have_css 'h5 + p.text-muted'
          end
        end
      end

      describe 'a button in the TileHeader' do
        let(:additional_options) { { button: tested_button, href: tested_href } }
        let(:tested_button) { nil }
        let(:tested_href) { nil }

        context 'and when :button is present in options' do
          let(:tested_button) { 'Tested Button' }

          it 'renders a button in the HTML' do
            expect(rendered_html).to eq "<div class=\"tile-header\"><div class=\"row\"><div class=\"col\"><div class=\"row\"><div class=\"col-12 col-md\"><h5 class=\"h4\">#{tested_title}</h5></div><div class=\"col-12 col-md-auto mt-md-0 mt-2\"><a class=\"btn btn-secondary\" href=\"#\">#{tested_button}</a></div></div></div></div></div>"

            expect(subject).to have_css '.col-12.col-md-auto.mt-md-0.mt-2 .btn'
          end

          context 'and when :href is present in options' do
            let(:tested_href) { 'tested_href' }
            it 'adds an href to the button' do
              expect(subject).to have_css ".btn-secondary[href='#{tested_href}']"
            end
          end

          context 'and when :href is not present in options' do
            it 'supplies a default value in the href' do
              expect(subject).to have_css ".btn-secondary[href='#']"
            end
          end
        end

        context 'and when :button is not present in options' do
          it 'does not render a button' do
            expect(subject).not_to have_css '.btn-secondary'

            and_it 'does not render the supporting structure code' do
              expect(subject).not_to have_css '.col-12.col-md-auto.mt-md-0.mt-2'
            end
          end
        end
      end

      describe 'a collapsible TileHeader' do
        let(:additional_options) { { collapse: tested_collapse, collapsed: tested_collapsed, collapsible: tested_collapsible } }
        let(:tested_collapsible) { nil }
        let(:tested_collapsed) { nil }
        let(:tested_collapse) { nil }

        context 'when a TileHeader is collapsible' do
          let(:tested_collapsible) { true }
          let(:tested_collapse) { '#the_target' } # the targeted collapsible div

          it 'renders the tile header with the collapse button and icon' do
            expect(rendered_html).to eq "<div class=\"tile-header\"><div class=\"row\"><div class=\"col\"><div class=\"row\"><div class=\"col-12 col-md\"><h5 class=\"h4\">#{tested_title}</h5></div></div></div><div class=\"col-auto pl-0\"><a class=\"btn btn-link\" data-collapse-icon=\"caret-up\" data-collapsed-icon=\"caret-down\" data-toggle=\"collapse\" href=\"#the_target\" aria-expanded=\"false\" aria-controls=\"the_target\" role=\"button\"><i data-toggle=\"tooltip\" data-placement=\"top\" data-html=\"true\" aria-hidden=\"true\" title=\"Show / hide additional information\" class=\"fa fa-caret-up fa-fw\"></i></a></div></div></div>"
          end

          context 'and when the tileheader is set to be collapsed' do
            let(:tested_collapsed) { true }
            it 'leverages the down icon to indicate the content below is expandable' do
              expect(subject).to have_css '.btn-link .fa-caret-down'
            end
          end

          context 'and when the tileheader is set to be expanded' do
            let(:tested_collapsed) { false }
            it 'leverages the up icon to indicate the content below is collapsible' do
              expect(subject).to have_css '.btn-link .fa-caret-up'
            end
          end
        end

        context 'when a TileHeader is not collapsible' do
          let(:tested_collapsible) { false }
          it 'does not include the collapse button and icon' do
            expect(subject).not_to have_css "[data-toggle='collapse'] .fa"
          end
        end
      end
    end

    context 'when :title is not present in options' do
      let(:tested_title) { nil }
      it 'does not render the title html' do
        expect(rendered_html).to eq "<div class=\"tile-header\"></div>"
      end
    end
  end

  describe 'private methods' do
    describe '#contextual_collapsible_icon' do
      subject { tile_header.send(:contextual_collapsible_icon)}

      context 'when tile_header is collapsible' do
        let(:options) { { collapsed: tested_collapsed } }
        context 'and when the tile_header is collapsed' do
          let(:tested_collapsed) { true }
          it { is_expected.to eq tile_header.send(:collapsed_icon) }
        end

        context 'and when the tile_header is not collapsed' do
          let(:tested_collapsed) { false }
          it { is_expected.to eq tile_header.send(:collapse_icon) }
        end
      end

      context 'when tile_header is not collapsible' do
        let(:options) { { collapsible: false } }
        it { is_expected.to be_empty }

      end
    end

    describe '#non_html_attribute_options' do
      subject { tile_header.send(:non_html_attribute_options) }
      it { is_expected.to include :subtitle, :button, :href }
    end
  end
end
