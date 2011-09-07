class ApplicationController < ActionController::Base
  protect_from_forgery
end


def destroy_friendship_sent_request
    @friendship_sent_request = FriendshipSentRequest.find_by_to_user_and_from_user(session[:user_text_id], params[:id])
    @friendship_sent_request.destroy
end