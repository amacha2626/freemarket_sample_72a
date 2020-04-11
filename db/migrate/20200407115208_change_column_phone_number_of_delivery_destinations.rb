class ChangeColumnPhoneNumberOfDeliveryDestinations < ActiveRecord::Migration[5.0]
  def change
    change_column :delivery_destinations, :phone_number, :string
  end
end
