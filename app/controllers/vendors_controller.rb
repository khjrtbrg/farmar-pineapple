class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def login
    @vendor = Vendor.new
  end

  def create
    if @vendor = Vendor.find_by(username: params[:username])
      login_check
    else
      @vendor = Vendor.new(params.require(:vendor).permit(:username, :email, :description))
      if @vendor.save
        session[:vendor_id] = @vendor.id
        redirect_to "/vendors/dashboard"
      end
    end
  end

  def login_check # this is what happens when you post to the login
    session[:vendor_id] = @vendor.id
    redirect_to "/vendors/dashboard"
  end

  def show
    @vendor = Vendor.find(session[:vendor_id])
  end
end
