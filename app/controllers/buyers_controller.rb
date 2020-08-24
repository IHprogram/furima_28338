class BuyersController < ApplicationController

  def index
    @buyer = Item.find(params[:item_id])
  end

  def create
  end

  private

end
