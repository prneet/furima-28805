class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :new, :create]

  def index
  end

  def new
  end

  def create
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def order_params
    params.require(:user).permit(:name, :name_reading, :nickname)
  end
end
