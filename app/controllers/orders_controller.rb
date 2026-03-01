class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_invalid_access

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_invalid_access
    redirect_to root_path if current_user.id == @item.user_id || @item.order.present?
  end

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city,
                                          :house_number, :building_name, :phone_number, :token)
          .merge(user_id: current_user.id, item_id: @item.id)
  end
end
