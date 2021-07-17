class Genre < ApplicationRecord
# 念の為アソシエーションはコメントアウトしてます
# has_many:items
validates :name,presence:true
# validates :name, uniqueness: true
end
