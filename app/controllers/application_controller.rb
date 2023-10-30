class ApplicationController < ActionController::Base
  #要有 admin 權限才能進入
  protect_from_forgery with: :exception
  #定義找車 給車 動作 (current_cart / find_cart)
  helper_method :current_cart

  def admin_required #要有 admin 權限才能進入
    if !current_user.admin?
      redirect_to "/", alert: "You are not admin"
    end
  end

  def current_cart
    @current_cart ||= find_cart
  end

  #搜尋欄功能
  before_action :set_ransack_obj
  def set_ransack_obj
    @q = Product.ransack(params[:q])
  end

  private

  def find_cart
     cart = Cart.find_by(id: session[:cart_id])
     if cart.blank?
       cart = Cart.create
     end
     session[:cart_id] = cart.id
     return cart
  end
end
