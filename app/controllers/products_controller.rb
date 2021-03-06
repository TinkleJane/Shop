class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @product = Product.find(params[:id])

    if !current_cart.products.include?(@product)
        current_cart.add_product_to_cart(@product)
        flash[:notice] = "#{@product.title}成功加入购物车"
    else
        flash[:warning] = "购物车内已存在该商品"
    end

    redirect_to :back

  end


end
