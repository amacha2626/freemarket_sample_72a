class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.images.new
    @item.build_
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
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

  private

  def item_params
    params.require(:item).permit(:name, :description, )
  end
end
