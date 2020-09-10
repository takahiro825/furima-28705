class ItemsController < ApplicationController
  before_action :set_item, only: [:show,:edit, :update, :destroy]
  def index
    @items = Item.includes(:user).order("created_at DESC")
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

  def update
      if @item.user_id == current_user.id && @item.update(item_params)
           redirect_to item_path(@item.id)
      else
          render :edit
      end
  end

  def destroy
    if @item.destroy
       redirect_to root_path
    else
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image,:name, :explanation, :category_id, :status_id,:shipping_charges_id, :shipping_region_id, :days_until_shipping_id,:selling_price ) .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
