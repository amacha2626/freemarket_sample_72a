class ItemsController < ApplicationController

  def index
    @items = Item.all.order("created_at DESC").limit(3)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
   end
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

  def category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :brand_id, :condition, :postage_payer, :shipping_from, :necessary_days, :price, item_images_attributes: [:image]).merge(seller_id: 1)
  end
end
