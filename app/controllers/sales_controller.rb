class SalesController < ApplicationController

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
    @products = Product.all
  end
  def create
    @sale = Sale.new
  end

  def show

  end



end
