# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  
  def new
    @user = User.new
    # @user.profile.new
    # @profile = @user.profile.new
    # @profile = Profile.new
    @user.build_profile
    @user.build_delivery_destination
    # @user.delivery_destination.new
    # @delivery_destination = DeliveryDestination.new
  end

  def create

    @user = User.new(user_params)
    @user.profile.birth_day = params[:birth_day]["birth_day(1i)"]+ "-" + params[:birth_day]["birth_day(2i)"] + "-" + params[:birth_day]["birth_day(3i)"]
    if @user.save
    sign_in @user
    redirect_to root_path
    end
    # @profile = Profile.new(profile_params)
    # @user.build_profile

    # @delivery_destination = DeliveryDestination.new(delivery_destination_params)
    # @user.build_delivery_destination
  end
  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

   def user_params
    params.require(:user).permit(:nickname, :email, :password, profile_attributes: [:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day], delivery_destination_attributes: [:destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana, :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number])
   end
   
  #  def profile_params
  #   params.require(:profile).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :birth_year, :birth_month, :birth_day)
  #  end

  #  def delivery_destination_params
  #   params.require(:delivery_destination).permit(:destination_family_name, :destination_first_name, :destination_family_name_kana, :destination_first_name_kana, :postalcode, :prefectures, :city, :house_number, :building_name, :phone_number)
  #  end

end
