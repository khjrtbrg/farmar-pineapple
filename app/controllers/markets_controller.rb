class MarketsController < ApplicationController

  def index
    @markets = Market.all
  end

  def new
    @market = Market.new
  end

  def create
    @market = Market.new(market_params)
    if @market.save
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
    no_market_redirect
  end

  def update
    if find_market.update(market_params)
      redirect_to edit_vendor_path, :notice => "Market Updated!"
    else
      render "edit"
    end
  end

  def show
    if find_market
      find_market
    else
      redirect_to markets_path
    end
  end


  private ## methods below here are protected from accidentally being used elsewhere

  def find_market
    @market = Market.find(params[:id]) if Market.find_by(id: params[:id])
  end

  def no_market_redirect
    find_market ? find_market : redirect_to(edit_markets_landing_path)
  end

  def market_params
    (params.require(:market).permit(:name))
  end
end
