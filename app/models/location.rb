class Location < ApplicationRecord
  belongs_to :customer
  validates :postal_code, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def address_and_name
    "〒" +  self.postal_code + "　" + self.address + "　" + self.name
  end
end
