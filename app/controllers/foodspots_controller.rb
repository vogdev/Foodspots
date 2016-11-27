class FoodspotsController < ApplicationController
  before_action :authorize_admin, except: [:index, :show, :upvote, :downvote, :near, :popular]
  before_action :find_foodspot, only: [ :show, :edit, :update, :destroy, :upvote, :downvote]
  def index
      @foodspots = Foodspot.where(visible: true).order(cached_votes_total: :desc, created_at: :desc).take(6)
  end

  def show
      @voters_number = @foodspot.votes_for.voters.count
  end

  def popular
    # foodspots are orederd by total_votes first and created_at time second
    @foodspots = Foodspot.where(visible: true).paginate(:page => params[:page], :per_page => 6).order(cached_votes_total: :desc, created_at: :desc)
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
