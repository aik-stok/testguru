class BadgesController < ApplicationController

  before_action :set_badges, only: :index

  def index
  end
  
  private
  
  def set_badges
    @badges = current_user.badges
  end

end
