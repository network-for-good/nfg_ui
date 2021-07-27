shared_examples_for 'a component that includes the Methodable utility module' do
  describe 'Methodable module included in the component' do
    let(:component) { described_class.new(methodable_shared_examples_options, ActionController::Base.new.view_context) }
    let(:methodable_shared_examples_options) { {} }

    it { expect(described_class.included_modules).to include NfgUi::Components::Utilities::Methodable }
    it 'responds to the Methodable public methods' do
      expect(component).to respond_to :method
    end

    describe 'the updated :data' do
      let(:example_rails_helper_method) { { method: :delete } }
      context 'when data is already present in options' do
        let(:methodable_shared_examples_options) { { **example_rails_helper_method, data: example_data } }
        let(:example_data) { { example: :test } }
        it 'appends the method to data' do
          expect(component.data).to eq({ **example_data, **example_rails_helper_method })
        end
      end

      context 'when no data is present' do
        let(:methodable_shared_examples_options) {example_rails_helper_method }
        it 'adds the method to data' do
          expect(component.data).to eq example_rails_helper_method
        end
      end
    end
  end
end
