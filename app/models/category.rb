class Category < ApplicationRecord

  has_many :product_categories
  has_many :products, through: :product_categories

  # def products
  #   product_categories.map { |product_category| product_category.product }
  # end

end
