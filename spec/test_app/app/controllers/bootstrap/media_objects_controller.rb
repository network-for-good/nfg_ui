class Bootstrap::MediaObjectsController < Bootstrap::BaseBootstrapController
  def index
    redirect_to bootstrap_media_path
  end
end
