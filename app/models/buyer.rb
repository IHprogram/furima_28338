class Buyer < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :receiver

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
