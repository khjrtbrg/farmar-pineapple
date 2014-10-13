class VendorsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :vendor_not_found
  rescue_from NoMethodError, with: :vendor_not_found

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(vendor_params)
    if @vendor.save
      session[:user_id] = @vendor.id
      redirect_to dashboard_path, :notice => "Vendor Created!"
    else
      render "new"
    end
  end

  def dashboard
    if session[:user_id]
      @vendor = current_user
      @vendor.market ? @current_market = @vendor.market.name : @current_market = "No Market Selected"
      @total_sales = total_sales_finder(@vendor)
    else
      redirect_to root_path
    end
  end

  def total_sales_finder(vendor)
    total = 0
    vendor.sales.each do |sale|
      total += sale.product.price.to_i
    end
    return total
  end

  def edit
    @vendor = current_user
    @markets = Market.all
    @vendor.market ? @current_market = @vendor.market.name : @current_market = "No Market Selected"
    @edit_markets = true if @markets.size > 0
  end

  def update
    @vendor = current_user
    # These are separated out, instead of using .update because there needs to be a catch for the market_id
    @vendor.username = params[:vendor][:username]
    @vendor.email = params[:vendor][:email]
    @vendor.description = params[:vendor][:description]
    @vendor.market_id = params[:vendor][:market_id] if params[:vendor][:market_id] != "select"

    if @vendor.save
      redirect_to dashboard_path
    else
      flash.now.alert = "Something's wrong. Try again?"
      render "edit"
    end
  end

  def show
    find_vendor_no_session
  end

  def edit_redirect
    redirect_to vendors_path
  end

  def destroy_prep
    @vendor = current_user
  end

  def destroy
    current_user.destroy
    reset_session
    redirect_to root_path, :notice => "Vendor Deleted!"
  end


  private ## methods below here are protected from accidentally being used elsewhere

  def find_vendor_no_session
    @vendor = Vendor.find(params[:id]) if Vendor.find_by(id: params[:id])
  end

  def vendor_not_found
    redirect_to vendors_path
  end

  def vendor_params
    (params.require(:vendor).permit(:username, :email, :description))
  end
end
