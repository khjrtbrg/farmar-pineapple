class SessionsController < ApplicationController
  def index
  end

  def create
    @vendor = Vendor.authenticate(params[:username])
    if @vendor
      session[:user_id] = @vendor.id
      redirect_to "/dashboard", :notice => "Logged in!"
    else
      flash.now.alert = "Invalid username"
      render "index"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
