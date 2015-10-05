class FriendshipsController < ApplicationController
  def create
    Friendship.create user_id: params[:user_id], relative_id: params[:relative_id]
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end

  def destroy
    Friendship.where(user_id: params[:user_id], relative_id: params[:relative_id]).each do |friendship|
      friendship.destroy
    end
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end
end
