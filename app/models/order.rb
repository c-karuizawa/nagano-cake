class Order < ApplicationRecord
  belongs_to :customer
  enum payment: { card: 0, bank: 1}
end
