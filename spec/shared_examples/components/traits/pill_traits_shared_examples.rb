shared_examples_for 'a component that includes the Pill trait module' do
  describe 'Pill trait module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Pill }
    it "responds to the Pill traits' public methods" do
      expect(component).to respond_to(:pill_trait)
    end
  end

  describe 'registered traits' do
    it { expect(NfgUi::Components::Traits::Pill::TRAITS).to eq %i[pill] }
  end

  describe 'trait updates to components' do
    let(:options) { { traits: traits } }
    let(:traits) { [tested_trait] }
    let(:tested_trait) { nil }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }

    describe 'component attributes updated for the ruby component from traits' do
      describe ':pill trait' do
        let(:tested_trait) { :pill }
        it { expect(ruby_component.options[:pill]).to be true }
      end
    end

    describe 'pill traits as applied to rendered components' do
      let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
      let(:view_context) { ActionController::Base.new.view_context }
      let(:rendered_component) { view_context.ui.nfg(component_symbolic_name, ruby_component.options) }

      subject { rendered_component }

      context 'when a registered pill trait is supplied' do
        describe ':pill trait' do
          context 'when pill trait is applied' do
            let(:tested_trait) { :pill }
            it 'applies the pill css class to the html' do
              expect(substring_present?(string: subject.tr('\"', "'"),
                                        starting_substring: "class='",
                                        ending_substring: "'",
                                        sought_substring: "#{ruby_component.send(:component_css_class)}-pill")).to be
            end
          end
        end

        context 'when pill trait is not applied' do
          let(:tested_trait) { nil }
          before { ruby_component.options[:pill] = false } # pill may be on by default
          it 'does not apply the pill css class to the html' do
            expect(substring_present?(string: subject.tr('\"', "'"),
                                      starting_substring: "class='",
                                      ending_substring: "'",
                                      sought_substring: "#{ruby_component.send(:component_css_class)}-pill")).not_to be
          end
        end
      end
    end
  end
end
