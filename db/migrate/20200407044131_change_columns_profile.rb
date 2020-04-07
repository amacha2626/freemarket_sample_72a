class ChangeColumnsProfile < ActiveRecord::Migration[5.0]
  def change
    remove_columns :profiles, :birth_year, :birth_month, :birth_day

    add_column :profiles, :birth_day, :date, null: false
  end
end
