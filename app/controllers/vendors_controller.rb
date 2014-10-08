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
      render "new"
    end
  end

  def edit
    @vendor = Vendor.find(session[:user_id])
  end

  def update
    @vendor = Vendor.find(session[:user_id])

    @vendor.username = params[:vendor][:username]
    @vendor.email = params[:vendor][:email]
    @vendor.description = params[:vendor][:description]

    if @vendor.save
      redirect_to "/dashboard"
    else
      render "edit"
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
    session[:user_id] = nil
    redirect_to root_path
  end
end
