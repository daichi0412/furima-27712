class ItemsController < ApplicationController

  def index
  end

  def create
    Item.create(item_params)
  end

  def new
  end
end