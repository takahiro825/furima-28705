class PurchasessController < ApplicationController
  before_action :authenticate_user!,only:[:index]
  before_action :move_to_top_page, only:[:index, :create]
  

 def index 
  @order = PurchasesShipping.new(address_params)
 end

 

 def create
  @order = PurchasesShipping.new(address_params)
  if @order.valid?
    pay_item
    @order.save
    redirect_to root_path
  else 
    render 'index'
  end
 end

 private

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.selling_price,  # 商品の値段
    card: params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類(日本円)
  )
  end

  def address_params
    params.permit(:token, :item_id,:postal_code, :prefectures_id, :city, :address, :building_name, :phone_number, :purchase).merge(user_id: current_user.id)
  end 

  def move_to_top_page
    @item = Item.find(params[:item_id])
    if  @item.user_id == current_user.id || @item.purchase != nil
      return redirect_to root_path
    end
  end

end
