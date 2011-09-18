class FriendshipSentRequestsController < ApplicationController
  # GET /friendship_sent_requests
  # GET /friendship_sent_requests.xml
  def index
    @friendship_sent_requests = FriendshipSentRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friendship_sent_requests }
    end
  end

  # GET /friendship_sent_requests/1
  # GET /friendship_sent_requests/1.xml
  def show
    @friendship_sent_request = FriendshipSentRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friendship_sent_request }
    end
  end

  # GET /friendship_sent_requests/new
  # GET /friendship_sent_requests/new.xml
  def new
    @friendship_sent_request = FriendshipSentRequest.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /friendship_sent_requests/1/edit
  def edit
    @friendship_sent_request = FriendshipSentRequest.find(params[:id])
  end

  # POST /friendship_sent_requests
  # POST /friendship_sent_requests.xml
  def create
    @friendship_sent_request = FriendshipSentRequest.new
    @to_user= User.find_by_user_id(params[:friend_request_user_field_id])
    if(!@to_user )
         redirect_to(profile_path, :alert => "Userid you entered is wrong. You entered: #{params[:friend_request_user_field_id]}")
         return
    end
    if((session[:user_text_id] == params[:friend_request_user_field_id]) )
          redirect_to(profile_path, :alert => "Sorry! But You entered your own userid :)")
          return
    end

    @existing_request = FriendshipSentRequest.find_by_from_user_and_to_user(session[:user_text_id],params[:friend_request_user_field_id])
    if(@existing_request)
         redirect_to(profile_path, :alert => "Please be patient. You already sent a friend request to: #{params[:friend_request_user_field_id]}")
         return
    end

    @already_friends = Friendship.find_by_friend1_id_and_friend2_id(session[:user_text_id],params[:friend_request_user_field_id])
    if(@already_friends)
         redirect_to(profile_path, :alert => "Funny! No friendship request sent. You are already friends with: #{params[:friend_request_user_field_id]}")
         return
    end

    @friendship_sent_request.from_user = session[:user_text_id]
    @friendship_sent_request.to_user = params[:friend_request_user_field_id]
    @friendship_sent_request.message = params[:friend_request_message_field_id]
    @friendship_sent_request.sent_date = Time.now

    respond_to do |format|
      if @friendship_sent_request.save
        format.html { redirect_to(profile_path, :alert => "Your friendship request was successfully sent to #{params[:friend_request_user_field_id]}") }

      else
        format.html { redirect_to(profile_path, :alert => "Errors occured in sending friendhsip request. Did you enter introduction message?") }

      end
    end
  end

  # PUT /friendship_sent_requests/1
  # PUT /friendship_sent_requests/1.xml
  def update
    @friendship_sent_request = FriendshipSentRequest.find(params[:id])

    respond_to do |format|
      if @friendship_sent_request.update_attributes(params[:friendship_sent_request])
        format.html { redirect_to(profile_url, :notice => 'Friendship sent request was successfully updated.') }

      else
        format.html { render :action => "edit" }

      end
    end
  end

  # DELETE /friendship_sent_requests/1
  # DELETE /friendship_sent_requests/1.xml
  def destroy
    destroy_friendship_sent_request()
    respond_to do |format|
      format.html { redirect_to(:back, :notice => "Friendship request from #{params[:id]} was rejected") }
      format.xml  { head :ok }
    end
  end
end
