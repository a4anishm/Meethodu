class MyContributionsController < ApplicationController


  def get_my_contributions
    @my_contributions = DonorRequest.find_all_by_sent_user_id(session[:user_text_id])
  end
end
