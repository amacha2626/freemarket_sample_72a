class ChangeTypeCreditCard < ActiveRecord::Migration[5.0]
  def change
    change_column :credit_cards, :costomer_id, :string,null:false
    change_column :credit_cards, :card_id, :string,null:false
  end
end
