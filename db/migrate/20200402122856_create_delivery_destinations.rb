class CreateDeliveryDestinations < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_destinations do |t|
      t.references :user, null: false, foreign_key: true
      t.string :destination_family_name, null: false
      t.string :destination_first_name, null: false
      t.string :destination_family_name_kana, null: false
      t.string :destination_first_name_kana, null: false
      t.integer :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :house_number, null: false
      t.string :building_name
      t.integer :phone_number, unique: true

      t.timestamps
    end
  end
end
