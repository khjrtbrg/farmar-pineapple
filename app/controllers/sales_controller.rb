class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def create
    @sale = Sale.new
  end

  def show

  end

end
