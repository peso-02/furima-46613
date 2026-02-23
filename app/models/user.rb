class User < ApplicationRecord
  # devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # validations
  validates :password,
            format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/, message: 'is invalid. Include both letters and numbers' },
            allow_blank: true
  validates :nickname, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/,
                                                               message: 'is invalid. Input full-width characters' }
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/,
                                                                         message: 'is invalid. Input full-width katakana characters' }
  validates :birth_date, presence: true

  # associations
  has_many :items
  has_many :orders
end
