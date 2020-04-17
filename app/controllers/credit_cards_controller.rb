class CreditCardsController < ApplicationController
  before_action :get_user_params, only: [ :edit, :confirmation, :show]
  before_action :get_payjp_info, only: [:new_create, :create, :delete, :show]

  def new
  end

  def edit
    card = current_user.credit_card
    if card.present?
      customer = Payjp::Customer.retrieve(credit_cards.costomer_id)
      @default_card_information = customer.cards.retrieve(credit_cards.card_id)
    else
      redirect_to action: "confirmation", id: current_user.id
    end
  end

  def create
    if params['payjp-token'].blank?
      redirect_to action: "edit", id: current_user.id
    else
      customer = Payjp::Customer.create(
      email: current_user.email,
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = CreditCard.new(user_id: current_user.id, costomer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to root_path
      else
        redirect_to action: "edit", id: current_user.id
      end
    end
  end
  
  def delete
    card = current_user.credit_card
    if card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = 'sk_test_0e2eb234eabf724bfaa4e676'
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
     #ここでpay.jpの方を消している
      card.delete
     #ここでテーブルにあるcardデータを消している
    end  
      # redirect_to action: "confirmation", id: current_user.id
  end

  def show
    card = current_user.credit_card
    if card.present?
      customer = Payjp::Customer.retrieve(card.costomer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    else
      redirect_to action: "confirmation", id: current_user.id
    end
  end

  def confirmation
    card = current_user.credit_cards
    redirect_to action: "show" if card.exists?
  end

  private

  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = 'sk_test_6f9f3ca9ec31150d8902b510'
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end

  def get_user_params
    current_user = User.find(params[:user_id])
  end
end