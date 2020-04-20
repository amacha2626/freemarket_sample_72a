class DeliveryDestinationsController < ApplicationController

  def new
  end

  def create
  end

  def edit
    @delivery = DeliveryDestination.find(params[:id])
  end

  def update
    delivery = DeliveryDestination.find(params[:id])
    delivery.update(delivery_params)
    redirect_to user_path(current_user)
  end

  private
  def delivery_params
    params.require(:delivery_destination).permit(:destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number)
  end
  
end
