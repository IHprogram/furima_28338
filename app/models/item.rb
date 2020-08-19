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

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id,     numericality: { other_than: 1 } 
  validates :status_id,       numericality: { other_than: 1 } 
  validates :shippingdate_id, numericality: { other_than: 1 } 
  validates :fee_id,          numericality: { other_than: 1 } 
  validates :prefecture_id,   numericality: { other_than: 1 } 

    #空欄では保存できないようにする
    validates :name, :content, :price, :category, :status, :shippingdate, :fee, :prefecture, presence: true

end
