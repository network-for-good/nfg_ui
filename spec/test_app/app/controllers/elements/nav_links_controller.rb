class Elements::NavLinksController < ApplicationController
  def index
    redirect_to elements_navs_path
  end
end
