class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases

  with_options presence: true do
    validates :nickname
    # validates :email, uniqueness: true
    # ラストネームの制約
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid.Input full-width characters." }
    # ファーストネームの制約
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "is invalid.Input full-width characters" }
    # ラストネーム（カナ）の制約
    validates :pseudonym_last, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid.Input full-width katakana characters." }
    # ファーストネーム（カナ）の制約
    validates :pseudonym_first, format: { with: /\A[ァ-ヶー－]+\z/, message: "is invalid.Input full-width katakana characters." }
    # 誕生日の制約
    validates :birthday
    # パスワードの制約
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers." }
  end
end
