class VendorsController < ApplicationController

  def index
    @vendors = Vendor.all
  end

  def new
    @vendor = Vendor.new
  end

  def create
    if @vendor = Vendor.find_by(username: params[:username])
      login_check
    else
      @vendor = Vendor.new(params.require(:vendor).permit(:username, :email, :description))
      if @vendor.save
        session[:user_id] = @vendor.id
        redirect_to "/vendors/dashboard"
      end
    end
  end

  def show
    if session[:user_id]
      @vendor = Vendor.find(session[:user_id])
    else
      redirect_to root_path
    end
  end
end
