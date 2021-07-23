class Public::SearchesController < ApplicationController
    
    def search
    # ここでジャンルid受け取る
    @content=params["search"]["value"]
    @records=Item.search_for(@content)
    end
    
end
