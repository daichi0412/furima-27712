class AddressPurchase

  include ActiveModel::Model
  attr_accessor :code, :prefecture_id, :city, :address, :tel, :building, :user_id, :item_id, :token

  with_options presence: true do
    validates :code, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" }
    validates :city
    validates :address 
    validates :tel, format: { with: /\A\d{11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(code: code, prefecture_id: prefecture_id, city: city, address: address, tel: tel, building: building, purchase_id: purchase.id)
  end
end



