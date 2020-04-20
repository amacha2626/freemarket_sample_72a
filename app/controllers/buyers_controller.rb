class BuyersController < ApplicationController
  require 'payjp'#Payjpの読み込み
  before_action :set_card, :set_item

  def index
    if @card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to new_credit_card_path
    else
      Payjp.api_key = Rails.application.secrets[:PAYJP_PRIVATE_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.costomer_id) 
      #カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    Payjp.api_key = Rails.application.secrets[:PAYJP_PRIVATE_KEY]
    if @item.update(buyer_id: current_user.id)
      Payjp::Charge.create(
        :amount => @item.price, #支払金額を引っ張ってくる
        :customer => @card.costomer_id,  #顧客ID
        :currency => 'jpy',              #日本円
      )
      redirect_to done_item_buyers_path #完了画面に移動
    else
      redirect_to item_buyers_path(params[:item_id])
    end
  end

  def done
  end

  private

  def set_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
