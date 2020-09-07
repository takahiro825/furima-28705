class Item < ApplicationRecord
belongs_to :user
has_one :purchase

extend ActiveHash::Associations::ActiveRecordExtensions
 belongs_to_active_hash :category
 belongs_to_active_hash :status
 belongs_to_active_hash :shipping_charges
 belongs_to_active_hash :shipping_region
 belongs_to_active_hash :days_until_shipping 
#アクティブハッシュのアソシエーション

has_one_attached :image  #アクティブストレージのアソシエーション



#空の投稿を保存できないようにする
validates :image, :name, :explanation, :category_id, :status_id, :shipping_charges_id, :shipping_region_id, :days_until_shipping_id, :selling_price, presence: true


#ジャンルの選択が「--」の時は保存できないようにする
validates :category_id, :status_id, :shipping_charges_id, :shipping_region_id, :days_until_shipping_id, numericality: { other_than: 1 } 

#販売価格は半角数字のみ入力可能であること
with_options presence: true, format: { with:/\A[a-z0-9]+\z/ } do
  validates :selling_price
end

validates :selling_price,numericality: { greater_than: 299 }
validates :selling_price,numericality:{ less_than:9999999}

end
