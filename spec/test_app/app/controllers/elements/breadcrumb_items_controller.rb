class Elements::BreadcrumbItemsController < ApplicationController
  def index
    redirect_to elements_breadcrumbs_path
  end
end
