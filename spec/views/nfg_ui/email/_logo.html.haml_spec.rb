RSpec.describe "nfg_ui/email/_logo", type: :view do
  before { render partial: "nfg_ui/email/logo" }

  it "renders an img tag pointing to the Stitch Backdrop PNG" do
    expect(rendered).to have_css(
      "img[src='https://cdn.bonterra.network/stitch/logos/png/bonterra_logolockups_network_for_good_inverse.png']"
    )
  end

  it "uses the updated alt text" do
    expect(rendered).to have_css("img[alt='Bonterra Network for Good']")
  end
end
