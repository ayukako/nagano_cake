class Public::CartItemsController < ApplicationController

  before_action :authenticate_customer!, except: [:show, :index]
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to public_cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.delete
    redirect_to public_cart_items_path
  end

  def destroy_all
    cart_item = CartItem.all
    cart_item.destroy_all
    redirect_to public_cart_items_path
  end

  def create
    if CartItem.find_by(customer_id: current_customer.id, item_id: cart_item_params[:item_id])
      cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: cart_item_params[:item_id])
      cart_item.update(amount: cart_item.amount + cart_item_params[:amount].to_i)
    else
     @cart_item = CartItem.new(cart_item_params)
     @cart_item.customer_id = current_customer.id
     @cart_item.save
    end
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end

end
