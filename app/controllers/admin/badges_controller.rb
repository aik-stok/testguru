class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show edit update destroy]
  before_action :set_badges, only: %i[index update_inline]

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
      redirect_to [:admin, @badge], notice: 'Badge was successfully created.'
    else
      render :new
    end
  end

  def update
    if @badge.update(answer_params)
      redirect_to [:admin, @badge], notice: 'Badge was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def set_badge
    @badge = Badge.find(params[:id])
  end
  
  def set_badges
    @badges = Badge.all
  end

  def badge_params
    params.require(:badge).permit(:title, :rule)
  end
end
