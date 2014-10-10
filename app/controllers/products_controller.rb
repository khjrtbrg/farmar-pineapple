class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.vendor_id = session[:user_id]
    if @product.save
      redirect_to dashboard_path, :notice => "Product Created!"
    else
      render "index"
    end
  end

  def show
    if find_product
      find_product
    else
      redirect_to products_path
    end
  end

  def edit
    no_product_redirect
  end

  def update
    if find_product.update(product_params)
      redirect_to dashboard_path, :notice => "Product Updated!"
    else
      render "edit"
    end
  end

  def destroy_prep
    no_product_redirect
  end

  def destroy
    find_product.destroy
    redirect_to dashboard_path, :notice => "Product Deleted!"
  end


  private ## methods below here are protected from accidentally being used elsewhere

  def find_product
    @product = Product.find(params[:id]) if Product.find_by(id: params[:id])
  end

  def no_product_redirect
    find_product ? find_product : redirect_to(dashboard_path)
  end

  def product_params
    (params.require(:product).permit(:name, :price))
  end
end
