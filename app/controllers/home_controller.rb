class HomeController < ApplicationController

  def index

    @products = [
      Product.new(
        title: "German Red Pied cow",
        description: "Organic grass fed beef."
      ),
      Product.new(
        title: "Blaarkop",
        description: "Dutch beef by the kilo."
      ),
      Product.new(
        title: "Organic onions",
        description: "French white onions per square meter"
      )
    ]

  end
end
