class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC"),per(3)
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def buy
  end

end
