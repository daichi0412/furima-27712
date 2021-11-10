class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  belongs_to :user
  has_one :purchase
  has_one_attached :image
  

  with_options presence: true do
    validates :image
    validates :name
    validates :comment
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :fee_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price, numericality: {only_integer:true, greater_than_or_equal_to: 300,less_than_or_equal_to:9_999_999}
  end

end
