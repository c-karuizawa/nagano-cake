class Item < ApplicationRecord
    # before_save :taxin_price
    # データベース保存時に、税抜価格と税込価格を登録します。

    attachment :image
    belongs_to:genre
    has_many:order_items
    has_many:cart_items

    has_many:orders,through: :order_items
    
    
    # has_many:orders,through: :order_items



    validates :name,:introduction,:price,presence:true
    validates :introduction, length: {maximum: 250}
    # 数値のみしか受け入れません！！
    validates :price, numericality: { only_integer: true }



# 　　private
    def taxin_price
        price*1.1
    end

    def self.search_for(content)
        Item.where('name LIKE ?', '%'+content+'%')
    end
        
end
