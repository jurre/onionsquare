class HomeController < ApplicationController

  def index
    @location = request.location
    @products = Product.order(:id).take(3)
  end
end
