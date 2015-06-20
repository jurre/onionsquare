class HomeController < ApplicationController

  def index
    @products = Product.take(3)
  end
end
