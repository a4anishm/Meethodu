class ProfileController < ApplicationController

  def index

   
  end

  def show
    @user = User.find_by_user_id(session[:user_text_id])
    @friends = User.joins("INNER JOIN friendships on friendships.friend1_id = users.user_id").where("friendships.friend2_id = ?", session[:user_text_id])
    @incoming_friend_users=User.joins("INNER JOIN friendship_sent_requests on friendship_sent_requests.from_user = users.user_id").where("friendship_sent_requests.to_user = ?", session[:user_text_id])
  end

  def create
  end

  def edit
  end

end
