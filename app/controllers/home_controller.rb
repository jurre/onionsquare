class HomeController < ApplicationController

  def index
    @location = request.location
    @products = Product.order(:id).take(3)
  end

  def map
    location = [params[:lat], params[:long]]
    @products = Product.near(location, 150, units: :km).text_search(params[:search])
  end
end
