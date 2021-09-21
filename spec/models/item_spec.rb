require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '#create' do
    context 'can save' do
      it "is valid with a name, comment, category_id, status_id, fee_id, prefecture_id, scheduled_delivery_id, price" do
        @item.valid?
        expect(@item).to be_valid
      end
    end

    context 'can not save'
      it "is invalid without a image" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "is invalid without a name" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it "is invalid without a comment" do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end

      it "is invalid without a category_id" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "is invalid without a status_id" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "is invalid without a fee_id" do
        @item.fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it "is invalid without a prefecture_id" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "is invalid without a scheduled_delivery_id" do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it "is invalid without a price" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "is invalid with a price that input half-width numbers" do
        @item.price = "１１１１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "is invalid with a price that greater than 300yens" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it "is invalid with a price that less than 9999999yens" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end

