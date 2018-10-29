class Elements::MediaObjectsController < ApplicationController
  def index
    redirect_to patterns_media_path
  end
end
