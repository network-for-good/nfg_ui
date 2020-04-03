shared_examples_for 'a component that includes the CollapseToggleable utility module' do |component_suite:, skip_link_href_test: false|
  describe 'CollapseToggleable module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Bootstrap::Utilities::CollapseToggleable }
    it 'responds to the CollapseToggleable public methods' do
      expect(component).to respond_to :data
    end
  end

  describe 'a collapse toggleable (rendered) component' do
    let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
    let(:view_context) { ActionController::Base.new.view_context }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }
    let(:rendered_component) { view_context.ui.send(component_suite, component_symbolic_name, ruby_component.options) }
    let(:options) { {} }

    subject { uniform_rendered_component(rendered_component) }

    context 'when a collapse is present in options' do
      let(:tested_collapse_word) { 'tested_collapse_word' }
      let(:tested_collapse) { "##{tested_collapse_word}" }
      let(:options) { { collapse: tested_collapse } }

      describe 'data attributes' do
        context 'and when the component has data attributes' do
          let(:tested_data_key) { 'tested-key' }
          let(:tested_data_value) { 'tested-value' }
          let(:options) { { collapse: tested_collapse, data: { tested_data_key => tested_data_value } } }

          it 'includes the collapse data toggle along with the existing attributes' do
            expect(subject).to include "data-toggle='collapse'", "#{tested_data_key}='#{tested_data_value}'"
          end

          # In some instances, this test is not necessary, :skip_link_href_test allows us to bypass this test
          unless skip_link_href_test
            context 'when the the component is :as <a>' do
              let(:options) { { collapse: tested_collapse, as: :a } }
              it 'does not add the data-target attribute' do
                if ruby_component.class.method_defined?(:as)
                  expect(subject).not_to include "data-target='#{tested_collapse}'"
                end
              end

              it 'sets the href to the collapse value' do
                if ruby_component.class.method_defined?(:as)
                  expect(subject).to include "href='#{tested_collapse}'"
                end
              end
            end
          end

          context 'when the component is not an <a> link' do
            let(:options) { { collapse: tested_collapse, as: @as } }
            it 'does not include an href with the collapse value' do
              @as = :button if ruby_component.class.method_defined?(:as)
              expect(subject).not_to include "href='#{tested_collapse}'"
            end

            it 'does adds the data-target data attribute' do
              @as = :button if ruby_component.class.method_defined?(:as)
              expect(subject).to include "data-target='#{tested_collapse}'"
            end
          end
        end

        context 'and when the component does not have data attributes' do
          let(:options) { { collapse: tested_collapse } }
          it 'adds the data toggle attribute' do
            expect(subject).to include "data-toggle='collapse'"
          end
        end
      end

      describe 'assistive html attributes' do
        context 'and when the component has aria assistive html attributes' do
          let(:tested_aria_key) { 'doessomething' }
          let(:tested_aria_value) { 'andsomethingelse' }
          let(:options) { { collapse: tested_collapse, aria: { tested_aria_key => tested_aria_value } } }
          it 'merges the arias together in html' do
            expect(subject).to include "aria-expanded='false'", "aria-controls='#{tested_collapse_word}", "#{tested_aria_key}='#{tested_aria_value}'"
          end
        end

        context 'and when the component does not have aria attributes' do
          it 'applies the assistive html attributes' do
            expect(subject).to include "aria-expanded='false'", "aria-controls='#{tested_collapse_word}'", "role='button'"
          end
        end

        context 'and when the component has the same aria attributes that collapse needs' do
          let(:aria_expanded) { 'arbitrary-expanded' }
          let(:aria_controls) { 'arbitrary-controlls' }
          let(:options) { { collapse: tested_collapse, aria: { expanded: aria_expanded, controls: aria_controls } } }
          it 'overwrites the pre-existing aria attributes and uses the collapse attributes' do
            expect(subject).not_to include "aria-expanded='#{aria_expanded}'", "aria-controls='#{aria_controls}"
            expect(subject).to include "aria-expanded='false'", "aria-controls='#{tested_collapse_word}'"
          end
        end

        context 'and when the component already has a role set' do
          let(:role) { 'tested-button' }
          let(:options) { { collapse: tested_collapse, role: role } }
          it 'overwrites the original :role and sets it to button' do
            expect(subject).not_to include "role='#{role}'"
            expect(subject).to include "role='button'"
          end
        end
      end
    end

    context 'when collapse is not present in options' do
      let(:options) { {} }
      it 'does not apply the additional html attributes' do
        by 'not applying the collapse data attributes' do
          expect(subject).not_to include "data-toggle='collapse'"
        end

        and_by 'not applying the collapse assistive html attributes' do
          expect(subject).not_to include "role='button'"
        end
      end
    end
  end
end
