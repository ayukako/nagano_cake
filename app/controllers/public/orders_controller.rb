class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def confirm
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
    @order.postage = 800
    if params[:order][:select_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:select_address] == "3"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]
    end
  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
    order_detail = OrderDetail.new
    order_detail.item_id = cart_item.item_id
    order_detail.order_id = @order.id
    order_detail.price_before_tax = cart_item.item.price
    order_detail.amount = cart_item.amount
    order_detail.production_status = 0
    order_detail.save
     end
     current_customer.cart_items.destroy_all
    redirect_to thanks_public_orders_path
  end

  def index
    @order = Order.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name, :postage, :payment)
  end


end
