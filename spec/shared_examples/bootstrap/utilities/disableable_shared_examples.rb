shared_examples_for 'a component that includes the Disableable utility module' do |component_suite:|
  describe 'Disableable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Disableable }
    it 'responds to the dismissible public methods' do
      expect(component).to respond_to :disabled
    end
  end

  describe 'a disableable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:rendered_component) { view_context.ui.send(component_suite, component_symbolic_name, ruby_component.options) }
    let(:options) { {} }

    subject { uniform_rendered_component(rendered_component) }

    context 'when :disabled is present in options' do
      describe 'the disabled css class' do
        context 'when :as is not a button' do
          let(:options) { { disabled: true } }
          it 'adds the disabled css class to the component html' do
            expect(substring_present?(string: subject,
                                      starting_substring: "class='",
                                      ending_substring: "'",
                                      sought_substring: 'disabled')).to be
          end
        end

        context 'when :as is a button' do
          let(:options) { { disabled: true, as: :button } }
          it 'does not add the disabled css class to the button html' do
            if ruby_component.class.respond_to?(:as)
              expect(substring_present?(string: subject,
                                        starting_substring: "class='",
                                        ending_substring: "'",
                                        sought_substring: 'disabled')).not_to be
            end
          end
        end
      end

      # <button etc... disabled class='etc'>
      describe 'the disabled html attribute' do
        context 'when :as is a button' do
          let(:options) { { disabled: true, as: :button } }
          it 'includes the disabled html5 attribute in the html' do
            if ruby_component.class.respond_to?(:as)
              by 'not including the disabled css class' do
                expect(substring_present?(string: subject,
                                          starting_substring: "class='",
                                          ending_substring: "'",
                                          sought_substring: 'disabled')).not_to be
              end

              and_by 'including the disabled html5 attribute' do
                # rails seems to insist on adding the ='disabled' to the disabled attribute. Still works, though
                expect(subject).to include "disabled='disabled'"
              end
            end
          end
        end

        context 'when :as is not a button' do
          let(:options) { { disabled: true } }
          before { ruby_component.instance_variable_set(:@css_classes, '') }
          it 'does not include the html5 disabled attribute' do
            expect(subject).not_to include "disabled='disabled'"
          end
        end
      end

      context 'when :disabled is not present in options' do
        let(:options) { {} }
        it 'does not add the disabled html updates to the component html' do
          by 'not adding the disabled css class' do
            expect(substring_present?(string: subject,
                                      starting_substring: "class='",
                                      ending_substring: "'",
                                      sought_substring: 'disabled')).not_to be
          end

          and_by 'not adding the disabled html5 attribute' do
            expect(subject).not_to include "disabled='disabled'"
          end
        end
      end
    end
  end
end
