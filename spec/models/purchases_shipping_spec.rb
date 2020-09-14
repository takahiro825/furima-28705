require 'rails_helper'
describe PurchasesShipping do
  before do
    @seller = FactoryBot.create(:user)
    @buyer = FactoryBot.create(:user)
    @item = FactoryBot.build(:item,user_id: @seller.id)
    @item.image = fixture_file_upload('public/images/test_image.png')
    @item.save
    @purchases_shipping = FactoryBot.build(:purchases_shipping, user_id: @buyer.id, item_id: @item.id)
  end
  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it "全て正常" do
         expect(@purchases_shipping.valid?).to eq true
      end
    end
    context '商品購入がうまくいかないとき' do
      it "tokenがないと登録できない" do
        @purchases_shipping.token = ""
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it "postal_codeがないと登録できない" do
        @purchases_shipping.postal_code = ""
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Postal code can't be blank")
      end
      it "prefectures_idがないと登録できない" do
      @purchases_shipping.prefectures_id = ""
      @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Prefectures can't be blank")
      end
      it "cityがないと登録できない" do
        @purchases_shipping.city = ""
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("City can't be blank")
      end
      it "addressがないと登録できない" do
        @purchases_shipping.address = ""
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberがないと登録できない" do
        @purchases_shipping.phone_number = ""
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Phone number can't be blank")
      end
      it "prefectures_idがid_1,name:'--'を選択した場合だと登録できない" do
        @purchases_shipping.prefectures_id = 1
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Prefectures must be other than 1")
      end
      it "postal_codeにハイフンがないと登録できない" do
        @purchases_shipping.postal_code = "1234567"
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeが8桁以上だと登録できない" do
        @purchases_shipping.postal_code = "1234-5678"
        @purchases_shipping.valid?
         expect(@purchases_shipping.errors.full_messages).to include("Postal code is invalid")
      end
      it "postal_codeに数字以外が入力されると登録できない" do
        @purchases_shipping.postal_code = "あいうaiu"
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Postal code is invalid")
      end
      it "phone_numberにハイフンがあると登録できない" do
        @purchases_shipping.phone_number = "090-1234-5678"
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberに数字以外があると登録できない" do
        @purchases_shipping.phone_number = "あいうaiu"
        @purchases_shipping.valid?
        binding.pry
        expect(@purchases_shipping.errors.full_messages).to include("Phone number is invalid")
      end
      it "phone_numberが12桁以上あると登録できない" do
        @purchases_shipping.phone_number = "012012345678"
        @purchases_shipping.valid?
        expect(@purchases_shipping.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end