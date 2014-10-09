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
  end

  def edit_post
    redirect_to "/market/#{params[:market][:id]}/edit" ## replace with path here!!
  end

  def edit
    if Market.find_by(id: params[:id])
      @market = Market.find_by(id: params[:id])
    else
      redirect_to edit_vendor_path
    end
  end

  def update
    @market = Market.find(params[:market][:id])
    @market.name = params[:market][:name]

    if @market.save
      flash.now.alert = "Market Updated"
      redirect_to edit_vendor_path
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
    find_market ? find_market : redirect_to(edit_vendor_path)
  end

  def market_params
    (params.require(:market).permit(:name))
  end
end
