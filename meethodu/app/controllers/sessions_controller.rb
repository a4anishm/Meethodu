class SessionsController < ApplicationController
  def new
    @account_buttons = Hash.new
    session[:login_status] = 0
    session[:user_id] = 0
  end

  def create
    if user=User.authenticate(params[:user_text_id], params[:password])
      session[:user_id] = user.id
      session[:user_text_id] = user.user_id
      session[:login_status] = 1
      session[:first_name] = user.first_name
      session[:last_name] = user.last_name
      params[:user_id] = user.id
      redirect_to profile_url
    else
      redirect_to login_url, :alert => "Invalid user/password combination"
    end


  end


  def about
  end

  def howit
  end

  def whyit
  end

  def doesit
  end

  def faq
  end

  def contact
  end
end
