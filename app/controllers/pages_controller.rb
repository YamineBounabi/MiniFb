class PagesController < ApplicationController

  autocomplete :user, :name 

  def index
    @walls = Wall.personal(current_user.relatives.map{|r| r.id}.push(current_user.id)).includes(:user)
    flash[:notice] = "#{@walls.length} Post(s)"
  end

  def show
    @user = User.find(params[:id])
    flash[:notice] = "#{@user.relatives.length} Friend(s)"
  end

  def search
    @users = User.search(params[:query])
    flash[:notice] = "#{@users.length} user(s)"
    render "results"
  end
end
