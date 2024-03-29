class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :purchased_item, only: [:index, :create]

  def index
  @purchase_card = PurchaseCard.new
  end

  def create
    @purchase_card = PurchaseCard.new(purchase_params)
    if @purchase_card.valid?
      pay_item
      @purchase_card.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_card).permit(:post_code, :sender_id, :city, :city_number, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def purchased_item
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.card.present?
      redirect_to root_path
    end
  end
end