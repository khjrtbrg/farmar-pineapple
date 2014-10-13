class SessionsController < ApplicationController
  def index
  end

  def create
    @vendor = Vendor.authenticate(params[:username])
    if @vendor
      session[:user_id] = @vendor.id
      redirect_to dashboard_path, :notice => "Logged In!"
    else
      flash.now.alert = "Invalid Username"
      render "index"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Logged Out!"
  end
end
