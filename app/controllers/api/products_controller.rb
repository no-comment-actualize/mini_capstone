class Api::ProductsController < ApplicationController

  def all_products_action
    @products = Product.all
    render "all_products.json.jb"
  end

  def first_product_action
    @product = Product.first
    render "first_product.json.jb"
  end

  def second_product_action
    @product = Product.find_by(id: 2)
    render "second_product.json.jb"
  end

  def third_product_action
    @product = Product.find_by(id: 3)
    render "second_product.json.jb"
  end

end
