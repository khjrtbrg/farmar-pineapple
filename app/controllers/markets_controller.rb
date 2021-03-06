class MarketsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :market_not_found
  rescue_from NoMethodError, with: :market_not_found

  def index
    @markets = Market.all
    respond_to do |format|
      format.html
      format.json { render json: @markets }
    end
  end

  def new
    current_user ? @market = Market.new : redirect_to(markets_path)
  end

  def create
    @market = Market.new(market_params)
    if @market.save && current_user
      redirect_to edit_vendor_path, :notice => "Market Created!"
    else
      render "new"
    end
  end

  def edit_prep
    @markets = Market.all
    if @markets.size == 0
      redirect_to edit_vendor_path, :alert => "No Markets to Edit"
    end
  end

  def edit_post
    redirect_to edit_market_path(params[:market][:id])
  end

  def edit
    current_user ? find_market : redirect_to(markets_path)
  end

  def update
    if find_market.update(market_params) && current_user
      redirect_to edit_vendor_path, :notice => "Market Updated!"
    else
      render "edit"
    end
  end

  def show
    find_market
  end


  private ## methods below here are protected from accidentally being used elsewhere

  def find_market
    @market = Market.find(params[:id])
  end

  def market_not_found
    if current_user
      redirect_to edit_markets_landing_path
    else
      redirect_to markets_path
    end
  end

  def market_params
    (params.require(:market).permit(:name, :location))
  end
end
