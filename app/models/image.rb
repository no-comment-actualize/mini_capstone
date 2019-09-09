class Image < ApplicationRecord

  def product
    # returns product hash that this image belongs to
    Product.find_by(id: product_id)
  end

end
