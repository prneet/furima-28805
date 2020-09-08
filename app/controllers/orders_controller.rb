class OrdersController < ApplicationController
  def index
  end

  def new
    @order = User.new
  end

  def create
    @donation = User.create(donation_params)
  end

  private

  def donation_params
    params.require(:user).permit(:name, :name_reading, :nickname)
  end
end
