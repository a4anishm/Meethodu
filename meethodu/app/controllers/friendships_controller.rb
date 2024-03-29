class FriendshipsController < ApplicationController
  # GET /friendships
  # GET /friendships.xml
  def index
    @friendships = Friendship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @friendships }
    end
  end

  # GET /friendships/1
  # GET /friendships/1.xml
  def show
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @friendship }
    end
  end

  # GET /friendships/new
  # GET /friendships/new.xml
  def new
    @friendship = Friendship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @friendship }
    end
  end

  # GET /friendships/1/edit
  def edit
    @friendship = Friendship.find(params[:id])
  end

  # POST /friendships
  # POST /friendships.xml
  def create
    @friendship = Friendship.new
    @friendship.friend1_id = params[:id]
    @friendship.friend2_id = session[:user_text_id]
    @friendship.begin_date = Time.now
    destroy_friendship_sent_request()
    respond_to do |format|
      if @friendship.save
        @friendship_copy = Friendship.new
        @friendship_copy.friend2_id = params[:id]
        @friendship_copy.friend1_id = session[:user_text_id]
        @friendship_copy.begin_date = Time.now
        @friendship_copy.save
        format.html { redirect_to(:back, :alert => "#{params[:id]} is your friend now.") }
        format.xml  { render :xml => @friendship, :status => :created, :location => @friendship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /friendships/1
  # PUT /friendships/1.xml
  def update
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      if @friendship.update_attributes(params[:friendship])
        format.html { redirect_to(@friendship, :notice => 'Friendship was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @friendship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.xml
  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to(friendships_url) }
      format.xml  { head :ok }
    end
  end


end
