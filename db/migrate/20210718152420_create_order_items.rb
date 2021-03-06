class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :item_id, null: false, default: ""
      t.integer :order_id, null: false, default: ""
      t.integer :quantity, null: false, default: ""
      t.integer :product_status, null: false, default: 0
      t.integer :taxin_price, null: false, default: ""

      t.timestamps
    end
  end
end
