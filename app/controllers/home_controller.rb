class HomeController < ApplicationController

  def index
  end

  def search
    @search_term = params[:search]
    array = search_query(@search_term)
    @market_results = array[0]
    @vendor_results = array[1]
    @market_results.count > 0 ? @market_label = "Market Results" : nil
    @vendor_results.count > 0 ? @vendor_label = "Vendor Results" : nil
    array.flatten.count == 0 ? @no_results_label = "Sorry, 0 Results for \"#{@search_term}\"" : nil
  end

  def search_query(search_term)
    @search = []
    @search << Market.where(name: search_term)
    @search << Vendor.where(username: search_term)
  end

end
