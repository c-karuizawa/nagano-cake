class Public::SearchesController < ApplicationController
    
    def search
    # ここでジャンルid受け取る
    @value = params["search"]["value"]
    @content=params[:content]
    @records=Item.search_for(@content)
    @records=Item.search_for(@value)
    end
    
end
