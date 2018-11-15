class Elements::CardBodiesController < ApplicationController
  def index
    redirect_to patterns_cards_path
  end
end
