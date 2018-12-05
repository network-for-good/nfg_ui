class Elements::StepsController < ApplicationController
  def index
    redirect_to patterns_steps_path
  end
end
