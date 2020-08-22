class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
    @items = Item.all.order('created_at DESC')
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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
     if @item.update(item_params)
      redirect_to item_path(@item.id) 
     else
      render "edit"
     end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :status_id, :shippingdate_id, :fee_id, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
