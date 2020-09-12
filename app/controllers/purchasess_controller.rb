class PurchasessController < ApplicationController
  before_action :authenticate_user!,only:[:index]

 def index 
  @item = Item.find(params[:item_id])
 end

 def create
  binding.pry
 end
end
