class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.references :user, foreign_key: true
      t.bigint :card_number
      t.integer :expiration_year
      t.string :expiration_month
      t.integer :security_code
      t.string :campany

      t.timestamps
    end
  end
end
