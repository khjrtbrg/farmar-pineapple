class ProductsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :product_not_found
  rescue_from NoMethodError, with: :product_not_found

  def index
    @products = Product.all
  end

  def new
    current_user ? @product = Product.new : redirect_to(products_path)
  end

  def create
    @product = Product.new(product_params)
    @product.vendor_id = current_user.id
    if @product.save && current_user
      redirect_to dashboard_path, :notice => "Product Created!"
    else
      render "index"
    end
  end

  def show
    find_product
  end

  def edit
    current_user ? find_product : redirect_to(products_path)
  end

  def update
    if find_product.update(product_params) && current_user
      redirect_to dashboard_path, :notice => "Product Updated!"
    else
      render "edit"
    end
  end

  def destroy_prep
    current_user ? find_product : redirect_to(products_path)
  end

  def destroy
    if current_user
      find_product.destroy
      redirect_to dashboard_path, :notice => "Product Deleted!"
    else
      redirect_to products_path
    end
  end


  private ## methods below here are protected from accidentally being used elsewhere

  def find_product
    @product = Product.find(params[:id])
  end

  def product_not_found
    if current_user
      redirect_to dashboard_path
    else
      redirect_to products_path
    end
  end

  def product_params
    (params.require(:product).permit(:name, :price))
  end
end
