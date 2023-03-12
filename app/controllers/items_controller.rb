class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :item_set, only: [:edit, :update, :show, :destory]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    if @item.user.id == current_user.id
    else
      redirect_to root_path
    end
  end

  def update
    @item.update(item_params)
    if @item.save
      redirect_to item_path
    else
      render 'edit'
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.user.id == current_user.id
      item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  private

  def item_params
    params.require(:item).permit(:image, :item_name, :explanation, :category_id, :delivery_charge_id, :number_of_day_id, :sender_id, :situation_id, :price).merge(user_id: current_user.id)
  end

  def item_set
    @item = Item.find(params[:id])
  end
end