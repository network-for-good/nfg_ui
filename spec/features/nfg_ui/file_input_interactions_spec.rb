require 'rails_helper'
require 'tmpdir'

# Regression coverage for NFG-4000 (pen test finding L1, DOM based XSS).
#
# app/assets/javascripts/nfg_ui/file_inputs.js writes the selected file's name
# into the adjacent .custom-file-label. When that write used .html(), a filename
# containing markup was parsed as HTML and executed in the browser.
RSpec.describe 'File input interactions', js: true do
  # The payload from the pen test report lives in the file NAME, not its contents.
  let(:payload_filename) { '<img src onerror=alert(document.cookie)>.png' }

  before { visit file_input_feature_spec_views_path }

  around do |example|
    Dir.mktmpdir do |dir|
      @payload_path = File.join(dir, payload_filename)
      File.write(@payload_path, 'not really a png')
      example.run
    end
  end

  it 'renders a filename containing markup as literal text, not as HTML' do
    and_by 'selecting a file whose name contains an XSS payload' do
      # The input is visually hidden by .custom-file, so make it interactable.
      attach_file('admin_image', @payload_path, make_visible: true)
    end

    and_it 'shows the filename verbatim in the label' do
      expect(page).to have_css('.custom-file-label', text: payload_filename)
    end

    and_it 'does not inject the payload element into the DOM' do
      expect(page).not_to have_css('.custom-file-label img', visible: :all)
      expect(page.evaluate_script("document.querySelectorAll('.custom-file-label img').length")).to eq(0)
    end

    and_it 'keeps the payload as escaped text inside the label' do
      label_html = page.evaluate_script("document.querySelector('.custom-file-label').innerHTML")
      expect(label_html).to include('&lt;img')
      expect(label_html).not_to include('<img')
    end

    and_it 'leaves the label element itself intact for styling' do
      expect(page).to have_css('label.custom-file-label[for="admin_image"]')
    end
  end
end
