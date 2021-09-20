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
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "is invalid without a status_id" do
        @item.status_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "is invalid without a fee_id" do
        @item.fee_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Fee can't be blank")
      end

      it "is invalid without a prefecture_id" do
        @item.prefecture_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "is invalid without a scheduled_delivery_id" do
        @item.scheduled_delivery_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it "is invalid without a price" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
