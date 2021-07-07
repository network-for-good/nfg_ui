require 'rails_helper'

RSpec.describe NfgUi::Components::Patterns::Tile do
  let(:tile) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:options) { {} }
  it { expect(described_class).to be < NfgUi::Components::Base }
  it_behaves_like 'a component with a consistent initalized construction'
  it_behaves_like 'a component that includes the Collapsible utility module'
  it_behaves_like 'a component that includes the Iconable utility module'
  it_behaves_like 'a component that includes the Titleable utility module'
  it_behaves_like 'a component that includes the Collapse trait module'

  describe '#heading' do
    subject { tile.heading }
    let(:tested_option) { :heading }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#render_in_body' do
    subject { tile.render_in_body }
    let(:tested_option) { :render_in_body }
    it_behaves_like 'a fetched option with a defined fallback', fallback: true
  end

  describe '#subtitle' do
    subject { tile.subtitle }
    let(:tested_option) { :subtitle }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#button' do
    subject { tile.button }
    let(:tested_option) { :button }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#href' do
    subject { tile.href }
    let(:tested_option) { :href }
    it_behaves_like 'a fetched option with a defined fallback', fallback: nil
  end

  describe '#component_family' do
    subject { tile.component_family }
    it { is_expected.to eq :tile }
  end

  describe '#render' do
    let(:rendered_html) { tile.render }
    let(:render_in_body) { nil }
    let(:options) { { render_in_body: render_in_body, ** additional_options } }
    let(:additional_options) { {} }

    subject { Capybara.string(rendered_html) }

    context 'when render_in_body is true' do
      let(:render_in_body) { true }

      describe 'tile :title' do
        let(:additional_options) { { title: tested_title, icon: tested_icon, subtitle: tested_subtitle, button: tested_button, href: tested_href } }
        let(:tested_icon) { nil }
        let(:tested_subtitle) { nil }
        let(:tested_button) { nil }
        let(:tested_href) { nil }

        context 'and when :title is present in options' do
          let(:tested_title) { 'tested title' }

          it 'includes the title in the tile header' do
            expect(rendered_html).to eq "<div class=\"tile\"><div class=\"tile-header\"><h5 class=\"h4\">#{tested_title}</h5></div><div class=\"tile-body\"></div></div>"
          end

          describe 'tile :subtitle' do
            context 'and when :subtitle is present in options' do
              pending 'not yet implemented'
            end

            context 'and when :subtitle is not present in options' do
              pending 'not yet implemented'
            end
          end

          describe 'tile :button' do
            context 'and when :button is present in options' do

              pending 'not yet implemented'

              it 'includes the button in the tile header' do
                and_it 'adds the href to the button' do
                end
              end
            end

            context 'and when :button is not present in options' do
              pending 'not yet implemented'
            end
          end

          describe 'tile :icon' do
            context 'and when :icon is present in options' do
              let(:tested_icon) { 'check' }
              it 'renders the icon next to the title' do
                expect(subject).to have_css ".tile-header h5 .fa-#{tested_icon}"
              end
            end

            context 'and when :icon is not present in options' do
              let(:tested_icon) { nil }
              it 'does not render an icon' do
                expect(subject).not_to have_css ".tile-header .fa"
              end
            end
          end
        end

        context 'and when :title is not present in options' do
          let(:tested_title) { nil }
          it 'does not render a tile header nor title' do
            expect(rendered_html).to eq "<div class=\"tile\"><div class=\"tile-body\"></div></div>"
          end
        end
      end

      describe 'tile :heading' do
        let(:additional_options) { { heading: tested_heading } }
        context 'and when tile :heading is present in options' do
          let(:tested_heading) { 'tested heading' }
          it 'includes the tile heading in the tile body' do
            expect(rendered_html).to eq "<div class=\"tile\"><div class=\"tile-body\"><h5>#{tested_heading}</h5></div></div>"
          end
        end

        context 'and when tile :heading is not present in options' do
          let(:tested_heading) { nil }
          it 'does not include the tile heading in the tile body' do
            expect(rendered_html).to eq "<div class=\"tile\"><div class=\"tile-body\"></div></div>"
          end
        end
      end

      describe 'collapsible tile' do
        let(:additional_options) { { title: 'here for collapse purposes', collapsible: tested_collapsible, id: tested_id, collapsed: tested_collapsed, body: tested_body } }
        let(:tested_id) { 'tested_id' }
        let(:tested_collapsed) { nil }
        let(:tested_body) { 'tested body' }

        context 'and when tile is :collapsible' do
          let(:tested_collapsible) { true }

          it 'creates a collapsible tile component' do
            by 'making the tile header control the collapsibility of the tile' do
              expect(subject).to have_css ".tile-header a[href='#collapse_#{tested_id}'][aria-controls='collapse_#{tested_id}'][data-toggle='collapse'] .fa-caret-up"
            end

            and_by 'setting the tile body as the collapsible content' do
              expect(subject).to have_css "#collapse_#{tested_id}.collapse.show .tile-body"
            end

            and_it 'renders the body' do
              expect(subject).to have_selector '.tile-body', text: tested_body
            end
          end

          context 'and when tile is :collapsed' do
            let(:tested_collapsed) { true }

            pending 'not yet implemented - fa-icon flip'

            it 'flips the fa-caret icon to down to indicate collapsed content' do

            end
            it 'collapses the tile body' do
              # sanity check
              by 'not including the show css class' do
                expect(subject).not_to have_css "#collapse_#{tested_id}.collapse.show .tile-body"
              end

              expect(subject).to have_css "#collapse_#{tested_id}.collapse .tile-body", visible: false

              and_it 'renders the body' do
                expect(subject).to have_selector '.tile-body', text: tested_body, visible: false
              end
            end
          end
        end

        context 'and when tile is not :collapsible' do
          let(:tested_collapsible) { false }

          it 'does not include a collapsible body' do
            by 'not including a collapse button in the header' do
              expect(subject).not_to have_css ".tile-header [data-toggle='collapse']"
            end
            and_by 'not wrapping the tile body in a collapse div' do
              expect(subject).not_to have_css ".collapse.show .tile-body"
            end

            and_it 'renders the body' do
              expect(subject).to have_selector '.tile-body', text: tested_body
            end
          end
        end
      end
    end

    context 'when render_in_body is false' do
      let(:render_in_body) { false }
      let(:additional_options) { { body: tested_body } }
      let(:tested_body) { 'tested body' }
      it 'renders the option supplied :body within the parent tile only' do
        expect(rendered_html).to eq "<div class=\"tile\">#{tested_body}</div>"
      end
    end
  end

  describe 'private methods' do
    describe '#non_html_attribute_options' do
      subject { tile.send(:non_html_attribute_options) }
      it { is_expected.to include :heading, :render_in_body, :subtitle, :button, :href }
    end
  end
end
