class MarketsController < ApplicationController
  def index
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
