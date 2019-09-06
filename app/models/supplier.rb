class Supplier < ApplicationRecord
  
  # supplier has many products
  def products
    # return an ARRAY (collection) of products that belong to THIS supplier
    Product.where(supplier_id: id)
  end

end
