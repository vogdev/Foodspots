class FoodspotsController < ApplicationController
  before_action :authorize_admin, except: [:index, :show, :upvote, :downvote,:near]
  before_action :find_foodspot, only: [ :show, :edit, :update, :destroy, :upvote, :downvote]
  def index
      @foodspots = Foodspot.where(visible: true)
  end

  def show
  end

def near
  # i commented this variables because i am in development mode => visitor_latitude and visitor_longitude are = 0.0
  # visitor_latitude = request.location.latitude
  # visitor_longitude = request.location.longitude
  visitor_latitude = 33.4324152
  visitor_longitude = -111.9052063
      @foodspots = Foodspot.near([visitor_latitude, visitor_longitude], 50, :ordare => :distance).where(visible: true)
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
        @foodspot.upvote_by current_user
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
