class Bootstrap::NavItemsController < Bootstrap::BaseBootstrapController
  def index
    redirect_to bootstrap_navs_path
  end
end
