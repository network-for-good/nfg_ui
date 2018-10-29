class Bootstrap::CarouselItemsController < Bootstrap::BaseBootstrapController
  def index
    redirect_to bootstrap_carousels_path
  end
end
