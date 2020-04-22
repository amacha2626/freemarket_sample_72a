class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    # ↓の seller_id:, buyer_id: は仮に"1"としている 実際はログインしているユーザーのidを入れたい
    @sell_items = Item.where(seller_id: current_user.id).order("created_at DESC").limit(3)
    @buyed_items = Item.where(buyer_id: current_user.id).order("created_at DESC").limit(3)
  end

  def edit
    card = CreditCard.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to new_card_path 
    else
      Payjp.api_key = Rails.application.secrets[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.costomer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def update
  end

  def logout
  end

  def credit
  end

end
