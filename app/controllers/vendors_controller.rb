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
      redirect_to "/dashboard"
    else
      flash.now.alert = "Something went wrong!"
      render "new"
    end
  end

  def show
    if session[:user_id]
      @vendor = Vendor.find(session[:user_id])
    else
      redirect_to root_path
    end
  end

  def destroy
    Vendor.find(session[:user_id]).destroy
    redirect_to root_path
  end
end
