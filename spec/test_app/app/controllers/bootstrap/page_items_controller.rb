class Bootstrap::PageItemsController < Bootstrap::BaseBootstrapController
  def index
    redirect_to bootstrap_paginations_path
  end
end
