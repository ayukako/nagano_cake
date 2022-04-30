class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to public_addresses_path
  end

  def update
    address = Address.find(params[:id])
    address.update(address_params)
    redirect_to public_address_path(address.id)
  end

  def destroy
  end


  private

  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end

end
