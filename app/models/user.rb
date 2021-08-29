class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[一-龥ぁ-ん]/, message: "Last name is invalid.Input full-width characters." }
    validates :first_name, format: { with: /\A[一-龥ぁ-ん]/, message: "First name is invalid.Input full-width characters" }
    validates :pseudonym_last, format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana is invalid.Input full-width katakana characters." }
    validates :pseudonym_first, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana is invalid.Input full-width katakana characters." }
    validates :birthday
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers." }
  end
end
