class ShippingAddress < ApplicationRecord
  belongs_to :purchase
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping_region

  
end
