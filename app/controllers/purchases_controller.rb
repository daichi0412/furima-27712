class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:show, :create, :index, :edit]

  def index
    @address_purchase = AddressPurchase.new
    if current_user.id == @item.user_id
      if @item.purchase.present?
        redirect_to root_path
      end
    end
  end
  
  def create
    @address_purchase = AddressPurchase.new(purchase_params)
    if @address_purchase.valid?
      pay_item
      @address_purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:address_purchase).permit(:code, :prefecture_id, :address, :city, :tel, :building).merge(user_id: current_user.id, item_id: (params[:item_id]), token: (params[:token]))
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: purchase_params[:token],
        currency: 'jpy'
      )
  end
end
