class HomeController < ApplicationController

  def index
    @products = Product.order("id DESC").take(3)
  end

  def map
    location = [params[:lat], params[:long]]
    @products = Product.near(location, 150, units: :km).text_search(params[:search])
  end
end
