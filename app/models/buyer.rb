class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :receiver, foreign_key: :buyer_id, dependent: :destroy
end
