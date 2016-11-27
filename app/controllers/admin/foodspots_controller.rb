class Admin::FoodspotsController < Admin::AdminController
  layout "admin"
  before_action :find_foodspot, only: [ :show, :edit, :update, :destroy, :upvote, :downvote]
  def index
    @foodspots = Foodspot.paginate(:page => params[:page], :per_page => 6).order(cached_votes_total: :desc, created_at: :desc)
    @users = User.all.count
  end
  def new
    @foodspot = Foodspot.new
  end

  def create
    @foodspot = Foodspot.create(foodspot_params)
    if @foodspot.save
      redirect_to  admin_foodspots_path
    else
      render 'new'
    end
  end
  def show
      @voters_number = @foodspot.votes_for.voters.count
  end
  def edit
    @foodspot
  end

  def update
    if @foodspot.update(foodspot_params)
      redirect_to [:admin, @foodspot]
    else
      redirect_to admin_foodspots_path
    end
  end

  def destroy
    if @foodspot.destroy
      redirect_to admin_foodspots_path
    else
      redirect_to [:admin, @foodspot]
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
       @foodspot = Foodspot.find(params[:id])
  end

end
