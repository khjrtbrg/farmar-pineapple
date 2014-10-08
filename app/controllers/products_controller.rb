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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:product][:id])
    @product.name = params[:product][:name]

    if @product.save
      redirect_to "/dashboard"
    else
      render "edit"
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to '/dashboard'
  end

end
