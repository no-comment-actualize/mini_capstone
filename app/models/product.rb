class Product < ApplicationRecord

  validates :name, :price, presence: true
  validates :name, uniqueness: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 10..500 }

  # product belongs to a supplier
  def supplier
    # return the supplier that THIS (self) product bleongs to
    Supplier.find_by(id: supplier_id)
    # returns a single supplier hash whos id matches THIS product's supplier_id
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
