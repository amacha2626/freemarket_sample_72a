class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      # t.references :category, null: false, foreign_key: true
      t.references :brand, foreign_key: true
      t.string :condition, null: false
      t.string :postage_payer, null: false
      t.string :shipping_from
      t.string :necessary_days, null: false
      t.integer :price, null: false
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
