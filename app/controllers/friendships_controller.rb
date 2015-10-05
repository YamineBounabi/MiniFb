class FriendshipsController < ApplicationController
  def create
    Friendship.create user_id: params[:user_id], relative_id: params[:relative_id]
    render :nothing => true, :status => 200, :content_type => 'text/html'
    #redirect_to request.referer || '/'
  end

  def destroy
    Friendship.where(user_id: params[:user_id], relative_id: params[:relative_id]).each do |friendship|
      friendship.destroy
    end
    render :nothing => true, :status => 200, :content_type => 'text/html'
    #redirect_to request.referer || '/'
  end
end
