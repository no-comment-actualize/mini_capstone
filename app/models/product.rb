class Product < ApplicationRecord

  # validates :name, :price, presence: true
  # validates :name, uniqueness: true
  # validates :price, numericality: { greater_than: 0 }
  # validates :description, length: { in: 10..500 }

  belongs_to :supplier
  # assumptions:
  # products table has supplier_id foreign key
  # a model called supplier exists
  # returns a single instance (hash) of the supplier class

  has_many :images
  has_many :orders

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
