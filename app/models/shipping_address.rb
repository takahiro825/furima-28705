class ShippingAddress < ApplicationRecord
  belongs_to :purchases
  
  with_options presence: true do
    validates :postal_code
    validates :prefectures_id
    validates :city
    validates :address 
    validates :phone_number
    validates :purchase
  end

end
