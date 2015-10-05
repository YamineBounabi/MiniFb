class WallsController < ApplicationController
  def create
    Wall.create user_id: current_user.id, relative_id: params[:relative_id], body: params[:body]
  end

  def destroy
  end
end
