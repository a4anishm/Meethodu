class ProfileController < ApplicationController

  def index

   
  end

  def show
    if(session[:user_id] == 0)
      redirect_to(login_url)
      return
    end
    @user = User.find_by_user_id(session[:user_text_id])
    @friends = User.joins("INNER JOIN friendships on friendships.friend1_id = users.user_id").where("friendships.friend2_id = ?", session[:user_text_id])
    @incoming_friend_users = User.joins("INNER JOIN friendship_sent_requests on friendship_sent_requests.from_user = users.user_id").where("friendship_sent_requests.to_user = ?", session[:user_text_id])
    @incoming_donation_requests = DonorRequest.joins("INNER JOIN projects on donor_requests.project_id = projects.id ").where("projects.user_id = ?", session[:user_text_id]).find_all_by_seen_by_receiver(false)
    @incoming_sent_money_updates = DonorRequest.joins("INNER JOIN projects on donor_requests.project_id = projects.id ").where(" projects.user_id = ?", session[:user_text_id]).find_all_by_sent_and_sponsor_received_money(true,false)
  end

  def create
  end

  def edit
  end

end
