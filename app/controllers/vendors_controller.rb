class VendorsController < ApplicationController

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
      @vendor = Vendor.find(session[:user_id])
      @vendor.market ? @current_market = @vendor.market.name : @current_market = "No Market Selected"
    else
      redirect_to root_path
    end
  end

  def edit
    find_vendor
    @markets = Market.all
    @vendor.market ? @current_market = @vendor.market.name : @current_market = "No Market Selected"
  end

  def update
    lookup_vendor
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

  def destroy_prep
    find_vendor
  end

  def destroy
    find_vendor.destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Vendor Deleted!"
  end


  private ## methods below here are protected from accidentally being used elsewhere

  def find_vendor
    lookup_vendor ? lookup_vendor : redirect_to(dashboard_path)
  end

  def lookup_vendor
    @vendor = Vendor.find(session[:user_id]) if Vendor.find_by(id: session[:user_id])
  end

  def vendor_params
    (params.require(:vendor).permit(:username, :email, :description))
  end
end
