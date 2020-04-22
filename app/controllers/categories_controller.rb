class CategoriesController < ApplicationController
  
  def index
  end

  def show
    @category = Category.find(params[:id])
    if @category.parent
      @parent = @category.parent
      if @parent.parent
        @grandparent = @parent.parent
      end
    end
    if @category.has_children?
      category_id = @category.descendant_ids
      @items = Item.where(category_id: category_id)
    else
      @items = Item.where(category_id: @category.id)
    end
  end
end