shared_examples_for 'a simple rendered component with a body' do
  let(:options) { { body: body } }
  let(:body) { 'test body' }
  let(:component) { described_class.new(options, ActionController::Base.new.view_context) }
  let(:rendered_html) { component.render }
  let(:css_class_name) { component.send(:component_css_class) }
  subject { Capybara.string(rendered_html) }

  it 'outputs a bootstrap component in html' do
    expect(subject).to have_css ".#{css_class_name}"
    expect(subject).to have_selector ".#{css_class_name}", text: body
    expect(rendered_html).to eq "<div class=\"#{css_class_name}\">#{body}</div>"
  end
end