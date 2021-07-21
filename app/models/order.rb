class Order < ApplicationRecord
  belongs_to :customer, optional: true
  has_many :order_items

  validates :postal_code, :address, :name, presence: true


  # enum payment: { card: 0, bank: 1 }
  # enum order_status: { waiting: 0, confirmed: 1, making: 2, preparing: 3, shipped: 4 }
  enum payment: { "クレジットカード": 0, "銀行振込": 1 }
  enum order_status: { "入金待ち": 0, "入金確認": 1, "製作中": 2, "発送準備中": 3, "発送済み": 4 }

end
