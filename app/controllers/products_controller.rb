class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
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
    if Product.find_by(id: params[:id])
      @product = Product.find_by(id: params[:id])
    else
      redirect_to "/dashboard"
    end
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
    if Product.find_by(id: params[:id])
      Product.find_by(id: params[:id]).destroy
    else
      redirect_to "/dashboard"
    end
  end

  def redirect
    redirect_to "/dashboard"
  end

end
