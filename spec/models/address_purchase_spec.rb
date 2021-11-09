require 'rails_helper'

RSpec.describe AddressPurchase, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @address_purchase = FactoryBot.build(:address_purchase, user_id: user.id, item_id: item.id)
    sleep 0.3
  end

  describe '#create' do
    context 'can save' do
      it "is valid with a code, prefecture_id, city, address, building, tel, token, user_id, item_id" do
        expect(@address_purchase).to be_valid
      end
      
      it "is valid without a building" do
        @address_purchase.building = ''
        expect(@address_purchase).to be_valid
      end
    end

    context 'can not save'
      it "is invalid without a code" do
        @address_purchase.code = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Code can't be blank")
      end

      it "is invalid without a hyphen" do
        @address_purchase.code = '1234567'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Code is invalid")
      end

      it "is invalid with a code that input half-width numbers" do
        @address_purchase.code = "１１１-１１１１"
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Code is invalid")
      end

      it "is invalid without a prefecture_id" do
        @address_purchase.prefecture_id = 1
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "is invalid without a city" do
        @address_purchase.city = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("City can't be blank")
      end

      it "is invalid without a address" do
        @address_purchase.address = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Address can't be blank")
      end

      it "is invalid without a tel" do
        @address_purchase.tel = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Tel can't be blank")
      end

      it "is invalid with a tel that has less than 11 numbers" do
        @address_purchase.tel = '090111111111'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Tel is invalid")
      end

      it "is invalid without a tel that input half-width numbers" do
        @address_purchase.tel = '０９０１１１１１１１１'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Tel is invalid")
      end

      it "is invalid with a tel that input more than 9 numbers" do
        @address_purchase.tel = '090111111'
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Tel is invalid")
      end

      it "is invalid without a token" do
        @address_purchase.token = ''
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Token can't be blank")
      end

      it "is invalid without a user_id" do
        @address_purchase.user_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("User can't be blank")
      end

      it "is invalid without a item_id" do
        @address_purchase.item_id = nil
        @address_purchase.valid?
        expect(@address_purchase.errors.full_messages).to include("Item can't be blank")
      end
    end
  end

