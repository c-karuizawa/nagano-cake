class Order < ApplicationRecord
   has_many :order_items, dependent: :destroy
   belongs_to :customer
   
   enum order_status: { wait: 0, payment: 1, make: 2, preparing: 3, done: 4 }
   enum payment: { card: 0, bank: 1 }
   
   
  def subtotal
		order_items.to_a.sum { |item| item.subtotal }
  end
end
