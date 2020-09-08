class OrdersController < ApplicationController
  before_action :set_item

  def index
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_address).permit(:order_id, :postal_code, :genre_id, :city, :address, :build, :phone_number, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_898973b7cb3626ff2ca3b596"
    Payjp::Charge.create(
      amount: @item.id,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
