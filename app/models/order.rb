class Order < ApplicationRecord
  belongs_to :customer, optional: true
  enum payment: { card: 0, bank: 1 }
end
