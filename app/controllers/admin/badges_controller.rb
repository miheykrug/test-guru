class Admin::BadgesController < Admin::BaseController

  before_action :find_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit

  end

  def create
    @badge = Badge.new(badge_params)

    if @badge.save
      flash[:info] = t('.success')
      redirect_to [:admin, @badge]
    else
      render :new
    end
  end

  def update
    if @badge.update(badge_params)
      redirect_to [:admin, @badge]
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_url
  end


  private

  def find_badge
    @badge = Badge.find(params[:id])
  end

  def badge_params
    params.require(:badge).permit(:title, :file_name, :rule_id)
  end
end
