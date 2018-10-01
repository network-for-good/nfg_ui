class Elements::MediaBodiesController < ApplicationController
  def index
    redirect_to patterns_media_path
  end
end
