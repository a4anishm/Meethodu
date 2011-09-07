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
      format.xml  { render :xml => @friendship_sent_request }
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
    @friendship_sent_request.from_user = session[:user_text_id]
    @friendship_sent_request.to_user = params[:friend_request_user_field_id]
    @friendship_sent_request.message = params[:friend_request_message_field_id]
    @friendship_sent_request.sent_date = Time.now

    respond_to do |format|
      if @friendship_sent_request.save
        format.html { redirect_to(:back, :alert => "Your friendship request was successfully sent to #{params[:friend_request_user_field_id]}") }
        format.xml  { render :xml => @friendship_sent_request, :status => :created, :location => @friendship_sent_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @friendship_sent_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friendship_sent_requests/1
  # PUT /friendship_sent_requests/1.xml
  def update
    @friendship_sent_request = FriendshipSentRequest.find(params[:id])

    respond_to do |format|
      if @friendship_sent_request.update_attributes(params[:friendship_sent_request])
        format.html { redirect_to(@friendship_sent_request, :notice => 'Friendship sent request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friendship_sent_request.errors, :status => :unprocessable_entity }
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
