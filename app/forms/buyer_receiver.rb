class BuyerReceiver
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/
  PHONE_NUMBER_REGEX = /\A[0-9]{11}+\z/

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, message: 'input correctly' }
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX, message: 'input 11 half-width numbers' }
  end

  def save
    item = Item.find(item_id)
    buyer = Buyer.create(user_id: item.user_id, item_id: item.id)
    Receiver.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end
