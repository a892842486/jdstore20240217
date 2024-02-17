class Admin::ProductsController < ApplicationController

  before_action :authenticate_user! #必須先登入才能進入
  before_action :admin_required     #必須有 admin 權限才能進入
  layout "admin" #建立後台分頁

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :image, :series)
  end
end
