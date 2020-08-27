class BuyersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new
    if pay_item
      @buyer.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def buyer_params
    params.permit(:token).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency:'jpy'
    )
  end

end
