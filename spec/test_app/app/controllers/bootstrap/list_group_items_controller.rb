class Bootstrap::ListGroupItemsController < Bootstrap::BaseBootstrapController
  def index
    redirect_to bootstrap_list_groups_path
  end
end
