class OrderItem < ApplicationRecord
  def sum_of_price
    item.taxin_price * quantity
  end

 
   belongs_to :item
   belongs_to :order
   
   enum product_status: { can_not: 0, make_wait: 1, make: 2, finish: 3 }

   
   def subtotal
		taxin_price * quantity
   end
   

end
