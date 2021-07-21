class Order < ApplicationRecord

   has_many :order_items, dependent: :destroy
   belongs_to :customer, optional: true
   
   enum order_status: { wait: 0, payment: 1, make: 2, preparing: 3, done: 4 }
   enum payment: { card: 0, bank: 1 }
  #   enum payment: { "クレジットカード": 0, "銀行振込": 1 }
　　　　#   enum order_status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }
  
  VALID_POSTAL_CODE_REGEX =  /\A\d{7}\z/  #\Aから始まり\zに終わる\d{7}7桁の数字
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
   
  def subtotal
		order_items.to_a.sum { |item| item.subtotal }
  end

end
