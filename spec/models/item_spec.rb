require 'rails_helper'
describe Item do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item,user_id: @user.id)
    @item.image = fixture_file_upload('public/images/test_image.png')#画像をテストする為に表示する記述

  end

describe '商品出品' do
  context '商品出品がうまくいくとき' do
    it "image、name、explanation、category_id、status_id、shipping_charges_id、shipping_region_id、days_until_shipping_id、selling_price,user_idが存在すれば登録できる" do
      expect(@item).to be_valid
    end
    it "selling_priceが300円以上であれば登録できる" do
      @item. selling_price = "430"
      expect(@item).to be_valid
    end
    it "selling_priceが999,999,999円以下であれば登録できる" do
      @item. selling_price = "26800"
      expect(@item).to be_valid
    end
    it "selling_priceが半角数字であれば登録できる" do
      @item. selling_price = "123456"
      expect(@user).to be_valid 
    end  
 end
 
  context '商品出品がうまくいかないとき' do
    it "imageがないと登録できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "nameがないと登録できない" do
      @item.name = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
   end
   it "explanationがないと登録できない" do
    @item.explanation = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Explanation can't be blank")
    end
    it "category_idがないと登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "status_idがないと登録できない" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it "shipping_chargesがないと登録できない" do
      @item.shipping_charges_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges can't be blank")
    end
    it "shipping_region_idがないと登録できない" do
      @item.shipping_region_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping region can't be blank")
    end
    it "days_until_shipping_idがないと登録できない" do
      @item.days_until_shipping_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
    end
    it "selling_priceがないと登録できない" do
      @item.selling_price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price can't be blank")
    end 
    it "user_idがないと登録できない" do
      @item.user_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end 
    it "selling_priceの入力が全角だと登録できない" do
      @item.selling_price = "１２００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not a number")
    end 
    it "selling_priceが299円以下だと登録できない" do
      @item.selling_price = "200"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price must be greater than 299")
    end
    it "selling_priceが999,999,999円以上だと登録できない" do
      @item.selling_price = "1000000000"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price must be less than 9999999")
    end
    it "selling_priceの入力が数字以外だと登録できない" do
      @item.selling_price = "あいうaio"
      @item.valid?
      expect(@item.errors.full_messages).to include("Selling price is not a number")
    end 
    it "category_idがid_1,name:'--'を選択した場合だと登録できない" do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end
    it "status_idがid_1,name:'--'を選択した場合だと登録できない" do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 1")
    end
    it "shipping_charges_idがid_1,name:'--'を選択した場合だと登録できない" do
      @item.shipping_charges_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charges must be other than 1")
    end
    it "shipping_region_idがid_1,name:'--'を選択した場合だと登録できない" do
      @item.shipping_region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping region must be other than 1")
    end
    it "days_until_shipping_idがid_1,name:'--'を選択した場合だと登録できない" do
      @item.days_until_shipping_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Days until shipping must be other than 1")
    end
  end
 end
end