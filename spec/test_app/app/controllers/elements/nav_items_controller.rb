class Elements::NavItemsController < ApplicationController
  def index
    redirect_to elements_navs_path
  end
end
