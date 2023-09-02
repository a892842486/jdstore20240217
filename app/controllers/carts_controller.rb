class CartsController < ApplicationController

  def clean #一鍵清空購物車 動作
    current_cart.clean!
    flash[:warning] = "已清空購物車"
    redirect_to carts_path
  end
end
