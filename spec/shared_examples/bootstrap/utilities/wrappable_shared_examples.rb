shared_examples_for 'a component that includes the Wrappable utility module' do |component_suite:|
  describe 'Wrappable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::Wrappable }
    it 'responds to the wrappable public methods' do
      expect(component).to respond_to :as
    end
  end

  describe 'a themeable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:rendered_component) { view_context.ui.send(component_suite, component_symbolic_name, ruby_component.options) }
    let(:options) { {} }

    subject { rendered_component }

    context 'when :as is present in options' do
      let(:tested_as) { :span }
      let(:options) { { as: tested_as } }

      describe ':as button' do
        context 'when :as is :button' do
          let(:tested_as) { :button }
          it 'applies the button html element as the wrapper for the component' do
            by 'converting the component to a button' do
              expect(subject).to include '<button', '</button>'
            end

            and_by "adding type='button' to the assistive html attributes" do
              expect(substring_present?(string: subject.tr('\"', "'").tr("\n", ''),
                                        starting_substring: '<button',
                                        ending_substring: '</button>',
                                        sought_substring: "type='button'")).to be
            end
          end
        end

        context 'when :as is not :button' do
          let(:tested_as) { :span }
          it 'does not output a button element' do
            by 'not rendering the component with button html' do
              expect(subject).not_to include '<button', '</button>'
            end

            and_by 'not adding the type: button assistive html attribute' do
              expect(subject).not_to include "type='button'"
            end
          end
        end
      end

      describe 'automatically assigned :as wrapper elements' do
        describe ':href in options impact on automatically assigned wrapper element' do
          context 'when :href is present in options' do
            let(:options) { { href: 'http://www.website.com' } }

            # Note: some components overwrite href such as the dropdown toggle
            # which manually sets href to '#'
            # So, in this spec, we don't test if the href's URL is present, just that the attribute is
            it { expect(subject.tr('\"', "'").tr("\n", '')).to include '<a ', '</a>', "href=" }
          end

          # Note: some components have their default html wrapper element 
          # set to :a -- in these instances, we'll just skip the shared example
          # and verify that <a> is still present (so wrappable didn't break anything)
          context 'when :href is not present in options' do
            let(:options) { {} }
            context 'when component is not defaulted to <a>' do
              it 'does not output an <a> component' do
                unless ruby_component.send(:default_html_wrapper_element) == :a
                  expect(subject).not_to include  '<a ', '</a>'
                end
              end
            end

            context 'when component is defaulted to <a>' do              
              it 'renders the component as an <a>' do
                if ruby_component.send(:default_html_wrapper_element) == :a
                  expect(subject).to include  '<a ', '</a>'
                end
              end
            end
          end
        end

        describe 'the component with a type of submit' do
          context 'when options type is submit' do
          end

          context 'when options type is not submit' do
          end
        end
      end

      describe 'when neither href nor type is present in options' do
        let(:options) { {} }
        let(:default_module_wrapper_element) { let(:test_class) { Class.new { include NfgUi::Bootstrap::Utilities::Wrappable }.new.send(:default_html_wrapper_element) } }
      end
    end
    context 'when :as is not present in options' do
    end
  end
end
