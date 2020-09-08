class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :new, :create]

  def index
  end

  def new
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      render "index"
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def order_params
    params.require(:order_address).permit(:user_id, :order_id, :postal_code, :genre_id, :city, :address, :build, :phone_number)
  end
end
