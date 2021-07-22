class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :customer
    
    validates :item_id, :quantity, presence: true
    validates :quantity, numericality:{ only_integer: true }
    
    # numericality: 
    

    
    
  def sum_of_price
    item.taxin_price * quantity
  end
  
  
end
