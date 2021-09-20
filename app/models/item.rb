class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image
  

  with_options presence: true do
    validates :image
    validates :name
    validates :comment
    validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :fee_id, numericality: { other_than: 1 , message: "can't be blank", less_than_equal_to: 9999999, greater_than_equal_to: 300}, format: { with: /\A[0-9]+\z/, message:"is invalid.Input half-width numbers."}
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :price
  end

end
