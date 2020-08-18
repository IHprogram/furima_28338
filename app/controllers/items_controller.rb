class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  def index
  end
  
  def new
  end
  
  def create
    # Post.create(カラム名: params[:値])
  end

  def destroy
  end
  
  private

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
