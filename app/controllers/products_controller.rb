class ProductsController < ApplicationController
  def index
    @product = Product.new
  end

  def create
    @product = Product.new(params.require(:product).permit(:name))
    @product.vendor_id = session[:user_id] 
    if @product.save
      redirect_to "/dashboard"
    else
      render "index"
    end
  end
end
