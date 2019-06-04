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
                                      :dark_trait,
                                      :white_trait,
                                      :outlined_trait)
    end

    describe 'registered traits' do
      it { expect(NfgUi::Components::Traits::Theme::TRAITS).to eq %i[primary secondary success danger warning info light dark white outlined] }
    end

    describe 'trait updates to components' do
      let(:options) { { traits: traits } }
      let(:traits) { [tested_trait] }
      let(:tested_trait) { nil }
      let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }

      # describe 'options updated for the ruby component from traits' do
      #   it 'updates the color theme correctly' do
      #     # by 'confirming the trait updates the theme for the uniquely rendered component' do
      #       NfgUi::Components::Traits::Theme::COLOR_TRAITS.each do |theme_trait_name|
      #         themed_component = described_class.new({ traits: [theme_trait_name] }, ActionController::Base.new.view_context)
      #         expect(themed_component.theme).to eq theme_trait_name
      #       end
      #     # end
      #   end
      # end

      # Some components utilize the thematic trait (without themeable utility module)
      # to be able to pass the requested theme down to a child component
      # and thus does not get html updated on itself.
      if test_html
        describe 'theme traits as applied to rendered components' do
          let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
          let(:view_context) { ActionController::Base.new.view_context }
          let(:rendered_component) { view_context.ui.nfg(component_symbolic_name, ruby_component.options) }
          subject { rendered_component }

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

              describe ':success trait' do
                let(:tested_trait) { :success }
                it { expect(ruby_component.theme).to eq tested_trait }
                it_behaves_like 'a thematic color trait'
              end

              describe ':danger trait' do
                let(:tested_trait) { :danger }
                it { expect(ruby_component.theme).to eq tested_trait }
                it_behaves_like 'a thematic color trait'
              end

              describe ':warning trait' do
                let(:tested_trait) { :warning }
                it { expect(ruby_component.theme).to eq tested_trait }
                it_behaves_like 'a thematic color trait'
              end

              describe ':info trait' do
                let(:tested_trait) { :info }
                it { expect(ruby_component.theme).to eq tested_trait }
                it_behaves_like 'a thematic color trait'
              end

              describe ':light trait' do
                let(:tested_trait) { :light }
                it { expect(ruby_component.theme).to eq tested_trait }
                it_behaves_like 'a thematic color trait'
              end

              describe ':dark trait' do
                let(:tested_trait) { :dark }
                it { expect(ruby_component.theme).to eq tested_trait }
                it_behaves_like 'a thematic color trait'
              end

              describe ':white trait' do
                let(:tested_trait) { :white }
                it { expect(ruby_component.theme).to eq tested_trait }
                it_behaves_like 'a thematic color trait'
              end
            end

            context 'and when a component does have the additional :outlined trait' do
              let(:themes) { NfgUi::Components::Traits::Theme::COLOR_TRAITS }
              let(:traits) { [@theme, :outlined] }

              NfgUi::Components::Traits::Theme::COLOR_TRAITS.each do |theme|
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
                expect(substring_present?(string: subject.tr('\"', "'"),
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
end

shared_examples_for 'a thematic color trait' do
  it 'renders the component with the intended theme applied' do
    expect(substring_present?(string: subject.tr('\"', "'"),
                              starting_substring: "class='",
                              ending_substring: "'",
                              sought_substring: "#{ruby_component.send(:theme_css_class_prefix)}#{tested_trait}")).to be
  end
end
