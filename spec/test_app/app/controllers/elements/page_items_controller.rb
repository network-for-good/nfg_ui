class Elements::PageItemsController < ApplicationController
  def index
    redirect_to patterns_paginations_path
  end
end
