class PurchasesShipping

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id,:postal_code, :prefectures_id, :city, :address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :postal_code,      format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefectures_id,   numericality: { other_than: 1}
    validates :city,             format: { with: /\A[ぁ-んァ-ン一-龥]/}
    validates :address,          format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :phone_number,      format: { with: /\A0\d{10,11}\z/ }
    validates :token
  end

  def save
   # 購入情報を保存
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 配送先の情報を保存
    ShippingAddress.create!(postal_code: postal_code, prefectures_id: prefectures_id, 
    city:city, address:address, building_name:building_name, phone_number:phone_number, purchase_id:purchase.id )
  end
end