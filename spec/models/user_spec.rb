require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context 'ユーザー登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmation、family_name、first _name、family_name_kana、first _name_kana、birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上でであれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid 
      end
      it "passwordが半角英数字混同であれば登録できる" do
        @user.password = "abc123"
        @user.password_confirmation = "abc123"
        expect(@user).to be_valid 
      end
      it "ユーザー名の苗字は全角で入力すれば登録できる" do
        @user.family_name = "後藤"
        expect(@user).to be_valid 
      end
      it "ユーザー名の名前は全角で入力すれば登録できる" do
        @user.first_name = "貴裕"
        expect(@user).to be_valid 
      end
      it "ユーザー名の苗字のフリガナは全角（カタカナ）で入力すれば登録できる" do
        @user.family_name_kana = "ゴトウ"
        expect(@user).to be_valid 
      end
      it "ユーザー名の名前のフリガナは全角（カタカナ）で入力すれば登録できる" do
        @user.first_name_kana = "タカヒロ"
        expect(@user).to be_valid 
      end
   end
    context 'ユーザー登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
     end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
         expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "password_confirmationが存在してもpasswordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "family_nameが空では登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end 
      it "first_nameが空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_name_kanaが空では登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end 
      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it "ユーザー名の苗字は全角で入力しなければ登録できない" do
        @user.family_name = "ssss"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "ユーザー名の名前は全角で入力しなければ登録できない" do
        @user.first_name = "aaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "ユーザー名の苗字のフリガナは全角（カタカナ）で入力しなければ登録できない" do
        @user.family_name = "たたたた"
        @user.valid?
        expect(@user.errors.full_messages).to include()
      end
      it "ユーザー名の名前のフリガナは全角（カタカナ）で入力しなければ登録できない" do
        @user.first_name_kana = "おおおお"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
