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

  def show
    if find_product
      find_product
    else
      redirect_to "/products"
    end
  end

  def edit
    if find_product
      find_product
    else
      redirect_to "/dashboard"
    end
  end

  def update
    if find_product.update(params.require(:product).permit(:name))
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

  private

  def find_product
    @product = Product.find(params[:id]) if Product.find_by(id: params[:id])
  end
end
