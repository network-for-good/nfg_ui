require 'rails_helper'
RSpec.describe 'app/views/nfg_ui/app_icons/_icons.html.haml', type: :view do
  subject { render partial: 'nfg_ui/app_icons/icons' }

  # for :href key, do not include file extension,
  # DO    -> href: path/to/my_image
  # DON'T -> href: path/to/my_image.png
  let(:apple_touch_icon_attributes) { { href: 'nfg_ui/app_icon/apple-touch-icon', rel: 'apple-touch-icon', sizes: '180x180' } }
  let(:favicon_attributes) { { href: 'nfg_ui/app_icon/favicon', rel: 'shortcut icon' } }
  let(:favicon_32x32_attributes) { { href: 'nfg_ui/app_icon/favicon-32x32', rel: 'icon', sizes: '32x32', type: 'image/png'} }
  let(:favicon_16x16_attributes) { { href: 'nfg_ui/app_icon/favicon-16x16', rel: 'icon', sizes: '32x32', type: 'image/png'} }
  let(:safari_pinned_tab_attributes) { { href: 'nfg_ui/app_icon/safari-pinned-tab', rel: 'mask-icon', color: '#25ACEB' } }

  it 'includes the apple touch icon' do
    expect(subject).to have_css "link#{element_attributes(attributes: apple_touch_icon_attributes)}", visible: :all
  end

  it 'includes the standard favicon.ico' do
    expect(subject).to have_css "link#{element_attributes(attributes: favicon_attributes)}", visible: :all
  end

  it 'includes the 32x32 favicon' do
    expect(subject).to have_css "link#{element_attributes(attributes: favicon_32x32_attributes)}", visible: :all
  end

  it 'includes the 16x16 favicon' do
    expect(subject).to have_css "link#{element_attributes(attributes: favicon_32x32_attributes)}", visible: :all
  end

  it 'includes the site.webmanifest meta tag' do
    expect(subject).to have_css "link[href$='.webmanifest'][href^='/assets/nfg_ui/app_icon/site'][rel='manifest']", visible: :all

    and_it 'does not have a type attribute' do
      expect(subject).not_to have_css "link[rel='manifest'][type]", visible: :all
    end
  end

  it 'includes the safari pinned tab (mask icon)' do
    expect(subject).to have_css "link#{element_attributes(attributes: safari_pinned_tab_attributes)}", visible: :all

    and_it 'does not have a `type` attribute' do
      expect(subject).not_to have_css "link#{element_attributes(attributes: safari_pinned_tab_attributes)}[type]", visible: :all
    end
  end

  it 'includes the msapplication settings' do
    expect(subject).to have_css "meta[content='#ffffff'][name='msapplication-TileColor']", visible: :all
  end

  it 'references browserconfig.xml' do
    expect(subject).to have_css "meta[name='msapplication-config'][content^='/assets/nfg_ui/app_icon/browserconfig']", visible: :all
  end

  it 'includes the meta theme-color' do
    expect(subject).to have_css "meta[content='#ffffff'][name='theme-color']", visible: :all
  end
end

private

def element_attributes(attributes: {})
  attribute_string = []
  attributes.each do |k,v|
    next if v.empty?
    k = k.to_s

    if k == 'href'
      # add the ^ [starts with] wildcard to the href key, example:
      # [href^='/assets/nfg_ui/app_icon/filename_without_extension']
      k += '^'
      v = "/assets/#{v}"
    end

    attribute_string << "[#{k}='#{v}']"
  end

  attribute_string.join.squish
end
