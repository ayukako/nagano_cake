class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:select_address] == 1
    elsif params[:select_address] == 2
    else params[:select_address] == 3

    end

  end

  def thanks
  end

  def create
    @order = Order.new(order_params)
    if params[:select_address] == 1
      customer.address.save
      #自身の住所を保存する処理
    elsif params[:select_address] == 2
      customer.address.save
      #登録済みの住所を保存する処理
    else params[:select_address] == 3
    end
    
  end

  def index
  end

  def show
  end

  def order_params
  params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end

end
