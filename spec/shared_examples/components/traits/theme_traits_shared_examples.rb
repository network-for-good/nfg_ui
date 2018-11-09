shared_examples_for 'a component that includes the Theme trait module' do |test_html: true|
  describe 'Theme trait module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Theme }
    it "responds to the Theme traits' public methods" do
      expect(component).to respond_to(:primary_trait,
                                      :secondary_trait,
                                      :success_trait,
                                      :danger_trait,
                                      :warning_trait,
                                      :info_trait,
                                      :light_trait,
                                      :dark_trait)
    end

    describe 'theme traits as applied to rendered components' do
      let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
      let(:view_context) { ActionController::Base.new.view_context }
      let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
      let(:rendered_component) { view_context.ui.nfg(component_symbolic_name, ruby_component.options) }
      let(:options) { { traits: traits } }
      let(:traits) { [tested_trait] }
      let(:tested_trait) { nil }

      subject { rendered_component }

      describe 'options updated for the ruby component from traits' do
        describe ':primary trait' do
          let(:tested_trait) { :primary }
          it { expect(ruby_component.theme).to eq tested_trait }
        end

        describe ':secondary trait' do
          let(:tested_trait) { :secondary }
          it { expect(ruby_component.theme).to eq tested_trait }
        end

        describe ':secondary trait' do
          let(:tested_trait) { :success }
          it { expect(ruby_component.theme).to eq tested_trait }
        end

        describe ':secondary trait' do
          let(:tested_trait) { :danger }
          it { expect(ruby_component.theme).to eq tested_trait }
        end

        describe ':warning trait' do
          let(:tested_trait) { :danger }
          it { expect(ruby_component.theme).to eq tested_trait }
        end

        describe ':info trait' do
          let(:tested_trait) { :danger }
          it { expect(ruby_component.theme).to eq tested_trait }
        end

        describe ':light trait' do
          let(:tested_trait) { :danger }
          it { expect(ruby_component.theme).to eq tested_trait }
        end

        describe ':dark trait' do
          let(:tested_trait) { :danger }
          it { expect(ruby_component.theme).to eq tested_trait }
        end

        describe ':outlined trait' do
          let(:tested_trait) { :outlined }
          it { expect(ruby_component.options[:outlined]).to be true }
        end
      end

      # Some components utilize the thematic trait (without themeable utility module)
      # to be able to pass the requested theme down to a child component
      # and thus does not get html updated on itself.
      if test_html
        context 'when a registered theme trait is supplied' do
          context 'and when a component does not have the additional :outlined trait' do
            describe ':primary trait' do
              let(:tested_trait) { :primary }
              it { expect(ruby_component.theme).to eq tested_trait }
              it_behaves_like 'a thematic color trait'
            end

            describe ':secondary trait' do
              let(:tested_trait) { :secondary }
              it { expect(ruby_component.theme).to eq tested_trait }
              it_behaves_like 'a thematic color trait'
            end

            describe ':secondary trait' do
              let(:tested_trait) { :success }
              it { expect(ruby_component.theme).to eq tested_trait }
              it_behaves_like 'a thematic color trait'
            end

            describe ':secondary trait' do
              let(:tested_trait) { :danger }
              it { expect(ruby_component.theme).to eq tested_trait }
              it_behaves_like 'a thematic color trait'
            end

            describe ':warning trait' do
              let(:tested_trait) { :danger }
              it { expect(ruby_component.theme).to eq tested_trait }
              it_behaves_like 'a thematic color trait'
            end

            describe ':info trait' do
              let(:tested_trait) { :danger }
              it { expect(ruby_component.theme).to eq tested_trait }
              it_behaves_like 'a thematic color trait'
            end

            describe ':light trait' do
              let(:tested_trait) { :danger }
              it { expect(ruby_component.theme).to eq tested_trait }
              it_behaves_like 'a thematic color trait'
            end

            describe ':dark trait' do
              let(:tested_trait) { :danger }
              it { expect(ruby_component.theme).to eq tested_trait }
              it_behaves_like 'a thematic color trait'
            end
          end

          context 'and when a component does have the additional :outlined trait' do
            let(:themes) { %i[primary secondary success danger warning info light dark] }
            let(:traits) { [@theme, :outlined] }
            
            %i[primary secondary success danger warning info light dark].each do |theme|
              it 'applies the theme with the outlined variation' do
                @theme = theme
                if ruby_component.send(:outlineable?)
                  expect(substring_present?(string: rendered_component.tr("\"", "'"),
                                            starting_substring: "class='",
                                            ending_substring: "'",
                                            sought_substring: "#{ruby_component.send(:theme_css_class_prefix)}#{ruby_component.send(:outlined_css_class_prefix)}#{theme}")).to be

                else
                  expect(substring_present?(string: rendered_component.tr("\"", "'"),
                                            starting_substring: "class='",
                                            ending_substring: "'",
                                            sought_substring: "#{ruby_component.send(:theme_css_class_prefix)}#{ruby_component.send(:outlined_css_class_prefix)}#{theme}")).not_to be

                  expect(substring_present?(string: rendered_component.tr("\"", "'"),
                                            starting_substring: "class='",
                                            ending_substring: "'",
                                            sought_substring: "#{ruby_component.send(:theme_css_class_prefix)}#{theme}")).to be
                end
              end
            end
          end
        end

        context 'when a non registered trait is supplied' do
          let(:tested_trait) { :non_registered_trait }
          it 'renders does not add an unregistered theme to the html' do
            if subject.match('class')
              expect(substring_present?(string: subject.tr("\"", "'"),
                                      starting_substring: "class='",
                                      ending_substring: "'",
                                      sought_substring: "#{ruby_component.send(:theme_css_class_prefix)}#{tested_trait}")).not_to be
            else
              expect(subject).not_to include "#{ruby_component.send(:theme_css_class_prefix)}#{tested_trait}"
            end
          end
        end
      end
    end
  end
end

shared_examples_for 'a thematic color trait' do
  it 'renders the component with the intended theme applied' do
    expect(substring_present?(string: subject.tr("\"", "'"),
                              starting_substring: "class='",
                              ending_substring: "'",
                              sought_substring: "#{ruby_component.send(:theme_css_class_prefix)}#{tested_trait}")).to be
  end
end
