class HomeController < ApplicationController

  def index
    @products = Product.order(:id).take(3)
  end
end
