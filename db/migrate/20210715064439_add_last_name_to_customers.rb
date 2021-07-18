class AddLastNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :last_name, :string, default: "", null: false
    add_column :customers, :first_name, :string, default: "", null: false
    add_column :customers, :last_name_kana, :string, default: "", null: false
    add_column :customers, :first_name_kana, :string, default: "", null: false
    add_column :customers, :postal_code, :string, default: "", null: false
    add_column :customers, :address, :string, default: "", null: false
    add_column :customers, :phone_number, :string, default: "", null: false
    add_column :customers, :is_active, :boolean, default: true, null: false
  end
end
