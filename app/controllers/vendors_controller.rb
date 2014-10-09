class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    @vendor = Vendor.new(params.require(:vendor).permit(:username, :email, :description))
    if @vendor.save
      session[:user_id] = @vendor.id
      redirect_to "/dashboard", :notice => "Vendor Created!"
    else
      render "new"
    end
  end

  def edit
    @vendor = Vendor.find(session[:user_id])
    @markets = Market.all
    @vendor.market ? @current_market = @vendor.market.name : @current_market = "No Market Selected"
  end

  def update
    @vendor = Vendor.find(session[:user_id])

    @vendor.username = params[:vendor][:username]
    @vendor.email = params[:vendor][:email]
    @vendor.description = params[:vendor][:description]
    @vendor.market_id = params[:vendor][:market_id] if params[:vendor][:market_id] != "select"

    if @vendor.save
      redirect_to "/dashboard"
    else
      flash.now.alert = "Something broke. Try again?"
      render "edit"
    end
  end

  def show
    if session[:user_id]
      @vendor = Vendor.find(session[:user_id])
      @vendor.market ? @current_market = @vendor.market.name : @current_market = "No Market Selected"
    else
      redirect_to root_path
    end
  end

  def destroy
    Vendor.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Vendor Deleted!"
  end
end
