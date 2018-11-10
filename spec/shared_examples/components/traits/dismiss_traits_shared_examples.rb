shared_examples_for 'a component that includes the Dismiss trait module' do
  describe 'Dismiss trait module included in the component' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    it { expect(described_class.included_modules).to include NfgUi::Components::Traits::Dismiss }
    it "responds to the Dismiss traits' public methods" do
      expect(component).to respond_to(:dismissible_trait)
    end
  end

  describe 'registered traits' do
    it { expect(NfgUi::Components::Traits::Dismiss::TRAITS).to eq %i[dismissible] }
  end

  describe 'trait updates to components' do
    let(:options) { { traits: traits } }
    let(:traits) { [tested_trait] }
    let(:tested_trait) { nil }
    let(:ruby_component) { described_class.new(options, ActionController::Base.new.view_context) }

    describe 'component attributes updated for the ruby component from traits' do
      describe ':dismissible trait' do
        let(:tested_trait) { :dismissible }
        it { expect(ruby_component.options[:dismissible]).to be true }
      end
    end

    describe 'dismissible traits as applied to rendered components' do
      let(:component_symbolic_name) { described_class.to_s.split('::').last.underscore.downcase.to_sym }
      let(:view_context) { ActionController::Base.new.view_context }
      let(:rendered_component) { view_context.ui.nfg(component_symbolic_name, ruby_component.options) }
      
      subject { rendered_component }

      context 'when a registered dismissible trait is supplied' do
        describe ':dismissible trait' do
          context 'when dismissible trait is applied' do
            let(:tested_trait) { :dismissible }
            it 'applies the dismissible css class to the html' do
              expect(substring_present?(string: subject.tr("\"", "'"),
                                        starting_substring: "class='",
                                        ending_substring: "'",
                                        sought_substring: 'dismissible')).to be
            end
          end
        end

        context 'when dismissible trait is not applied' do
          let(:tested_trait) { nil }
          before { ruby_component.options[:dismissible] = false } # dismissible may be on by default
          it 'does not apply the dismissible css class to the html' do
            expect(substring_present?(string: subject.tr("\"", "'"),
                                      starting_substring: "class='",
                                      ending_substring: "'",
                                      sought_substring: 'dismissible')).not_to be
          end
        end
      end
    end
  end
end
