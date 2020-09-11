class PurchasessController < ApplicationController
  before_action :authenticate_user!,only:[:index]

 def index 
  @item = Item.find(params[:id])
 end
end
