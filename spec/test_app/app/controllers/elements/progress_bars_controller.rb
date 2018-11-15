class Elements::ProgressBarsController < ApplicationController
  def index
    redirect_to patterns_progresses_path
  end
end
