class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def new
  end

  def create
    @market = Market.new(params.require(:market).permit(:name))
    if @market.save
      redirect_to "/edit", :notice => "Market Created!"
    else
      render "index"
    end
  end

  def edit_prep
    @markets = Market.all
  end

  def edit_post
    redirect_to "/market/#{params[:market][:id]}/edit"
  end

  def edit
    if Market.find_by(id: params[:id])
      @market = Market.find_by(id: params[:id])
    else
      redirect_to "/edit"
    end
  end

  def update
    @market = Market.find(params[:market][:id])
    @market.name = params[:market][:name]

    if @market.save
      flash.now.alert = "Market Updated"
      redirect_to "/edit"
    else
      render "edit"
    end
  end
end
