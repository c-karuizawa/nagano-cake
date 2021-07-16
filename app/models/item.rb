class Item < ApplicationRecord
    # before_save :taxin_price
    # データベース保存時に、税抜価格と税込価格を登録します。
    
    attachment :image
    
    # private
    def taxin_price
        price*1.1
    end
        
end
