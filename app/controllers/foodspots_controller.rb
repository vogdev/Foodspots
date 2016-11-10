class FoodspotsController < ApplicationController
  before_action :authorize_admin, except: [:index, :show, :upvote, :downvote]
  before_action :find_foodspot, only: [ :show, :edit, :update, :destroy, :upvote, :downvote]
  def index
    @foodspots = Foodspot.where(visible: true)
  end

  def show
  end

  def new
      @foodspot = Foodspot.new
  end

  def create
    @foodspot = Foodspot.create(foodspot_params)
    if @foodspot.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @foodspot
  end

  def update
    if @foodspot.update(foodspot_params)
      redirect_to @foodspot
    else
      redirect_to root_path
    end
  end

  def destroy
    if @foodspot.destroy
      redirect_to root_path
    else
      render @foodspot
    end
  end

  def upvote
    @foodspot.liked_by current_user
    redirect_back fallback_location: @foodspot
  end
  def downvote
    @foodspot.unliked_by current_user
    redirect_back fallback_location: @foodspot
  end

  private
  def foodspot_params
    params.require(:foodspot).permit(:name, :phone, :category_id, :address, :website, :visible, :image)
  end
  def find_foodspot
       @foodspot = Foodspot.where(visible: true).find(params[:id])
  end
end
