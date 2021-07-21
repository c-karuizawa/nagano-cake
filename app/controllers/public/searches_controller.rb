class Public::SearchesController < ApplicationController
    
    def search
    # ここでジャンルid受け取る
    @value = params["search"]["value"]
    @content=params[:content]
    @records=Item.search_for(@content)
    @records=Item.search_for(@value)
    end
    
    # private
    #  def match(value)
    # #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    #  Item.where(name: value).or(Item.where(genre_id: value))
    #  end
    
end
