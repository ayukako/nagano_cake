class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:select_address] == 1
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.name
    elsif params[:select_address] == 2
      @address = Address.find(params[:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    else params[:select_address] == 3
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.name = params[:name]
    end
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  def index
  end

  def show
  end

  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name, :order_status, :postage)
  end

end
