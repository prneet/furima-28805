class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new 
    @item = Item.new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end