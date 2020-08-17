class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :buyers

  validates :nickname, presence: true, uniqueness: true
  validates :birth_day, presence: true

  with_options presence: true, format:{ with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' } do
    validates :first_name
    validates :family_name
  end

  with_options presence: true, format:{ with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters' } do
    validates :first_name_furigana
    validates :family_name_furigana
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers' 

end
