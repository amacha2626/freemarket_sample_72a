class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC").limit(3)
  end

  
  def new
  end

  def create
  end

  def show
    @item = Item.find(params[:id])
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
    params.require(:items).permit(:name, :description, :category_id, :brand_id, :condition, :postage_payer, :shipping_from, :necessary_days, :price, :seller_id)
  end


end
