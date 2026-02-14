class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/,
                                 message: 'は6文字以上の半角英数字で、英字と数字の両方を含めてください' }, allow_blank: true
  validates :nickname, presence: true
  validates :first_name, :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }
  validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/ }
  validates :birth_date, presence: true
end
