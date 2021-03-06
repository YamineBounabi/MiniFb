class WallsController < ApplicationController
  def create
    Wall.create user_id: current_user.id, relative_id: params[:relative_id], body: params[:body]
    redirect_to request.referer || '/'
  end

  def destroy
    Wall.find(params[:id]).destroy
    redirect_to request.referer || '/'
  end
end
