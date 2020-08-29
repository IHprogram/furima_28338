class BuyersController < ApplicationController
  before_action :move_to_login
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
    @buyer = BuyerReceiver.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buyer = BuyerReceiver.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(item_id: @item.id)
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: item.price,
      card: params[:token],
      currency:'jpy'
    )
  end

  def move_to_login
    redirect_to new_user_session_path unless user_signed_in?
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path       
    end
  end

end
