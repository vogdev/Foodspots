class FoodspotsController < ApplicationController
  before_action :authorize_admin, except: [:index, :show, :upvote, :downvote, :near, :popular, :search]
  before_action :find_foodspot, only: [ :show, :edit, :update, :destroy, :upvote, :downvote]
  def search
    if params[:search].present?
      @foodspots = Foodspot.search (params[:search]), page: params[:page], per_page: 6, where: {visible: true}
    else
      redirect_back fallback_location: root_path
      flash[:notice] = "No spots match your search"
    end
  end
  def index
      @foodspots = Foodspot.VisibleFoodspots.take(6)
  end

  def show
      @voters_number = @foodspot.votes_for.voters.count
  end

  def popular
    # foodspots are orederd by total_votes first and created_at time second
    @foodspots = Foodspot.PopularFoodspots(params[:page])
  end

  def near
  # i commented this variables because i am in development mode => visitor_latitude and visitor_longitude are = 0.0
  # visitor_latitude = request.location.latitude
  # visitor_longitude = request.location.longitude
    visitor_latitude = 33.4324152
    visitor_longitude = -111.9052063
    @foodspots = Foodspot.near([visitor_latitude, visitor_longitude], 50, :ordare => :distance).where(visible: true)
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
  def find_foodspot
       @foodspot = Foodspot.where(visible: true).find(params[:id])
  end
end
