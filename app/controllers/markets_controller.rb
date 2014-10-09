class MarketsController < ApplicationController
  def index
    @markets = Market.all
  end

  def new
  end

  def create
    @market = Market.new(params.require(:market).permit(:name))
    if @market.save
      redirect_to "/edit"
    else
      render "index"
    end
  end
end
