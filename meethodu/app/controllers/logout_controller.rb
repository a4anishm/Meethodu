class LogoutController < ApplicationController
  def new
    session[:user_id] = 0
    session[:login_status] = 0
    session[:user_text_id] = 0
    respond_to do |format|
        format.html { redirect_to(login_path, :notice => 'You are successfully logged out') }
        format.xml  { render :xml => @friendship, :status => :created, :location => @friendship }
    end
  end

end
