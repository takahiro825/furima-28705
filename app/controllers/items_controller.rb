class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name, :explanation, :category_id, :status_id,:shipping_charges_id, :shipping_region_id, :days_until_shipping_id,:selling_price ) .merge(user_id: current_user.id)
  end
end
