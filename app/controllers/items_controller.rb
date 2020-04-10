class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC").limit(3)
  end

  
  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = [["---", ""]]
    Category.where(ancestry: nil).each do |parent|
      array = []
      array << parent.name
      array << parent.id
      @category_parent_array << array
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save

      redirect_to root_path
    else
      @category_parent_array = [["---", ""]]
      Category.where(ancestry: nil).each do |parent|
        array = []
        array << parent.name
        array << parent.id
        @category_parent_array << array
      end
      render :new
    end
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


  def category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :condition, :postage_payer, :shipping_from, :necessary_days, :price, item_images_attributes: [:image]).merge(seller_id: current_user.id)
  end
end
