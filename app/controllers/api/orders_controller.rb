class Api::OrdersController < ApplicationController

  def index
    @orders = current_user.orders
    render 'index.json.jb'
  end

  def show
    @order = Order.find_by(id: params[:id])
    render 'show.json.jb'
  end

  def create
    # product = Product.find(params[:product_id])

    # calculated_subtotal = product.price * params[:quantity].to_i
    # calculated_tax = calculated_subtotal * 0.09
    # calculated_total = calculated_subtotal + calculated_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      # subtotal: calculated_subtotal,
      # tax: calculated_tax,
      # total: calculated_total
    )

    # alternate way to use association method to get the product. Use attribute writers before the .save 
    @order.subtotal = @order.product.price * @order.quantity
    @order.tax = @order.subtotal * 0.09
    @order.total = @order.subtotal + @order.tax

    if @order.save
      render 'show.json.jb'
    else
      render json: {errors: @order.errors.full_messages}, status: :unprocessable_entity
    end
  end

end
