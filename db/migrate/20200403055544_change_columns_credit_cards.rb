class ChangeColumnsCreditCards < ActiveRecord::Migration[5.0]
  def change
    remove_columns :credit_cards, :card_number, :expiration_year, :expiration_month, :security_code, :campany

    add_column :credit_cards, :costomer_id, :integer, null: false
    add_column :credit_cards, :card_id, :integer, null: false
    change_column_null :credit_cards, :user_id, false
  end
end