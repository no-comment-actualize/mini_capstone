class Product < ApplicationRecord

  # validates :name, :price, presence: true
  # validates :name, uniqueness: true
  # validates :price, numericality: { greater_than: 0 }
  # validates :description, length: { in: 10..500 }

  belongs_to :supplier

  def images
    # return an ARRAY of images that are associated with this product
    Image.where(product_id: id)
  end

  def is_discounted?
    price <= 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

end
