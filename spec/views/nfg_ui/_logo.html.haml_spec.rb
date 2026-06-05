RSpec.describe "nfg_ui/_logo", type: :view do
  context "default (bonterra: false)" do
    before { render partial: "nfg_ui/logo" }

    it "renders the bonterra-logo web component with the NFG lockup" do
      expect(rendered).to have_css("bonterra-logo[name='bonterra_logolockups_network_for_good']")
    end

    it "links to networkforgood.com" do
      expect(rendered).to have_link(href: "http://www.networkforgood.com")
    end
  end

  context "bonterra: true" do
    before { render partial: "nfg_ui/logo", locals: { bonterra: true } }

    it "renders the bonterra-logo web component with the logomark" do
      expect(rendered).to have_css("bonterra-logo[name='bonterra_logomark']")
    end

    it "links to bonterratech.com" do
      expect(rendered).to have_link(href: "https://www.bonterratech.com")
    end
  end
end
