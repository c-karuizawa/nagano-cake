class OrderItem < ApplicationRecord
 
   belongs_to :item
   belongs_to :order
   
   enum product_status: { can_not: 0, make_wait: 1, make: 2, finish: 3 }
   VALID_POSTAL_CODE_REGEX = /\A\d{7}\z/ 
   validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
   
   def subtotal
		taxin_price * quantity
   end
   
end
