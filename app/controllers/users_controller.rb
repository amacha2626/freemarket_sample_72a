class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    # ↓の seller_id:, buyer_id: は仮に"1"としている 実際はログインしているユーザーのidを入れたい
    @sell_items = Item.where(seller_id: "1").order("created_at DESC").limit(3)
    @buyed_items = Item.where(buyer_id: "1").order("created_at DESC").limit(3)
  end

  def edit
  end

  def update
  end

  def logout
  end

  def credit
  end

end
