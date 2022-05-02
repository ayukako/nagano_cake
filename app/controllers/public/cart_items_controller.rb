class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
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
    @cart_item = CartItem.new(cart_item_params)
    if cart_item = CartItem.find_by(item_id: @cart_item.item_id)
      cart_item.update(amount: cart_item.amount + @cart_item.amount)
    else cart_item = CartItem.find_by(item_id: @cart_item.item_id)
      @cart_item.save
    end
    redirect_to public_cart_items_path
  end

  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
  end

end
