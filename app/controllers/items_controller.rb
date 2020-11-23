class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
  end

  private
  def item_params
    params.require(:item).permit(
      :name, :description, :price, :category_id,
      :condition_id, :shipping_id, :days_to_ship_id,
      :prefecture_id, :image
    ).merge(user_id: current_user.id)
  end

end
