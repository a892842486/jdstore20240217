class ProductsController < ApplicationController

 def index
   @products = Product.all
 end

 def show
   @product = Product.find(params[:id])
 end

 def add_to_cart #加入購物車 動作
   redirect_to :back
   flash[:notice] = "測試加入購物車"
 end

end
