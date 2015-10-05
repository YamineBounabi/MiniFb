class PagesController < ApplicationController
  def index
    @walls = Wall.personal(current_user.id).includes(:user)
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @users = User.search(params[:query])
    render "results"
  end
end
