class Item < ApplicationRecord
  belongs_to :user
  has_one :buyer
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shippingdate
  belongs_to_active_hash :fee
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :image
    validates :name
    validates :content
    validates :price,           format: { with: /\A[0-9]+\z/, message: 'Half-width number' }, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
    validates :category_id,     numericality: { other_than: 1, message: 'Select' }
    validates :status_id,       numericality: { other_than: 1, message: 'Select' }
    validates :fee_id,          numericality: { other_than: 1, message: 'Select' }
    validates :prefecture_id,   numericality: { other_than: 1, message: 'Select' }
    validates :shippingdate_id, numericality: { other_than: 1, message: 'Select' }
  end
end
