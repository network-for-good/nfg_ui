class Elements::TabPanesController < ApplicationController
  def index
    redirect_to patterns_tabs_path
  end
end
