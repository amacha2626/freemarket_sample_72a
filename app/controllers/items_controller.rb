class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC").limit(3)
  end

  
  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = [["---", ""]]
    @category_parent_array = Category.where(ancestry: nil).pluck(:name, :id)
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      @category_parent_array = [["---", ""]]
      @category_parent_array = Category.where(ancestry: nil).pluck(:name, :id)
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @item.item_images.find_by(item_id: params[:id])
    @category_parent_array = Category.where(ancestry: nil).pluck(:name, :id)

    @category_grandparent_id = Category.find(@item.category_id).parent.parent_id
    @category_children = Category.find(@category_grandparent_id).children.pluck(:name, :id)

    @category_parent_id = Category.find(@item.category_id).parent_id
    @category_grandchildren = Category.find(@category_parent_id).children.pluck(:name, :id)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      redirect_to edit_item_path
    end
  end

  def buy
  end

  def category_children
    @category_children = Category.find(params[:parent_id]).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find(params[:child_id]).children
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :condition, :postage_payer, :shipping_from, :necessary_days, :price, item_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end
end
