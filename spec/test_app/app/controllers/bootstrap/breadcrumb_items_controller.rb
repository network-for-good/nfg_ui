class Bootstrap::BreadcrumbItemsController < Bootstrap::BaseBootstrapController
  def index
    redirect_to bootstrap_breadcrumbs_path
  end
end
