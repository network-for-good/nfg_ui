class Elements::DropdownItemsController < ApplicationController
  def index
    redirect_to patterns_dropdowns_path
  end
end
