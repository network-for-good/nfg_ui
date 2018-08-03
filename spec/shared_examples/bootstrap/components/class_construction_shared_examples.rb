shared_examples_for 'a component with a consistent initalized construction' do
  describe 'default class construction' do
    let(:component) { described_class.new({}, ActionController::Base.new.view_context) }
    let(:unique_public_methods) { (component.public_methods - Class.public_methods).sort }
    
    it 'contains only the public methods and options it is expected to' do
      expect(unique_public_methods).to include(:body,
                                               :data,
                                               :html_options,
                                               :id,
                                               :options,
                                               :view_context,
                                               :view_context=)
      expect(component.options).to include(class: '', id: nil, body: nil, data: nil)
      expect(component.view_context).to be
      expect(component.id).to be_nil
      expect(component.data).to be_nil
      expect(component.body).to be_nil
      expect(component.html_options).to be
    end
  end
end
