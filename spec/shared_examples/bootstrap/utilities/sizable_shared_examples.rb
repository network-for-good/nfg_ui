# :skip is avaialble for skipping :lg
shared_examples_for 'a component that includes the Sizable utility module' do |component_suite:, skip: nil|
  describe 'Sizable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Sizable }
    it 'responds to the dismissible public methods' do
      expect(component).to respond_to :size
    end
  end

  describe 'a sizable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:rendered_component) { view_context.ui.send(component_suite, component_symbolic_name, ruby_component.options) }
    let(:options) { {} }

    subject { uniform_rendered_component(rendered_component) }

    context 'when a size is present in options' do
      let(:options) { { size: size } }
      context 'and when size is small' do
        let(:size) { :sm }
        it 'adds the small size css class to the component' do
          by 'adding the small size' do
            expect(substring_present?(string: subject,
                                      starting_substring: "class='",
                                      ending_substring: "'",
                                      sought_substring: "#{ruby_component.send(:size_css_class_prefix)}-#{size}")).to be
          end

          and_by 'not adding the large size' do
            expect(substring_present?(string: subject,
                                      starting_substring: "class='",
                                      ending_substring: "'",
                                      sought_substring: "#{ruby_component.send(:size_css_class_prefix)}-lg")).not_to be
          end
        end
      end

      unless skip == :lg
        context 'and when size is large' do
          let(:size) { :lg }
          it 'adds the large size css class to the component' do
            by 'adding the large size' do
              expect(substring_present?(string: subject,
                                        starting_substring: "class='",
                                        ending_substring: "'",
                                        sought_substring: "#{ruby_component.send(:size_css_class_prefix)}-#{size}")).to be
            end

            and_by 'not adding the small size' do
              expect(substring_present?(string: subject,
                                        starting_substring: "class='",
                                        ending_substring: "'",
                                        sought_substring: "#{ruby_component.send(:size_css_class_prefix)}-sm")).not_to be
            end
          end
        end
      end
    end

    context 'when size is not present in options' do
      let(:options) { {} }
      it 'does not apply a size css class to the html' do
        by 'not applying the small css class' do
          expect(substring_present?(string: subject,
                                    starting_substring: "class='",
                                    ending_substring: "'",
                                    sought_substring: "#{ruby_component.send(:size_css_class_prefix)}-sm")).not_to be
        end

        and_by 'not applying the large css class' do
          expect(substring_present?(string: subject,
                                    starting_substring: "class='",
                                    ending_substring: "'",
                                    sought_substring: "#{ruby_component.send(:size_css_class_prefix)}-lg")).not_to be
        end
      end
    end

    context 'when size is not a white listed size (:sm / :lg)' do
      let(:size) { :arbitrary }
      it 'does not apply a size css class to the html' do
        by 'not applying the small css class' do
          expect(substring_present?(string: subject,
                                    starting_substring: "class='",
                                    ending_substring: "'",
                                    sought_substring: "#{ruby_component.send(:size_css_class_prefix)}-sm")).not_to be
        end

        and_by 'not applying the large css class' do
          expect(substring_present?(string: subject,
                                    starting_substring: "class='",
                                    ending_substring: "'",
                                    sought_substring: "#{ruby_component.send(:size_css_class_prefix)}-lg")).not_to be
        end
      end
    end
  end
end
