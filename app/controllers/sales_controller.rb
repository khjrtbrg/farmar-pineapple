class SalesController < ApplicationController

  def index
    @sales = vendor_identifier.sales
  end

  def new
    @sale = Sale.new
    @vendor = Vendor.find(session[:user_id])
    @products = Product.where(vendor_id: @vendor.id)
  end

  def create
    @sale = Sale.new(sale_params)
    if @sale.save
      redirect_to dashboard_path, :notice => "Sale Created!"
    else
      render "new"
    end
  end

  def show
  end

  private ## methods below here are protected from accidentally being used elsewhere

  def sale_params
    (params.require(:sale).permit(:product_id))
  end

  def vendor_identifier
    @vendor = Vendor.find(session[:user_id])
  end
end
