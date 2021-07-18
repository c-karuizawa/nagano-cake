class Order < ApplicationRecord
   def subtotal
		order_items.taxin_price * order_items.quantity
   end
end
