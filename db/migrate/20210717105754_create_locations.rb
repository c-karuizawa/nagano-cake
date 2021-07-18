class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|

      t.integer :customer_id, null: false, default: ""
      t.string :postal_code, null: false, default: ""
      t.string :address, null: false, default: ""
      t.string :name, null: false, default: ""

      t.timestamps null: false
    end
  end
end
