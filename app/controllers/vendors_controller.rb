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
      redirect_to "/vendors/dashboard"
    end
  end

  def dashboard
  end
end
