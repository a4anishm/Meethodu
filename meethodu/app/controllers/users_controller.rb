class UsersController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @user = User.find(session[:user_id])
    if @user
      redirect_to(:action => show)
    else
      @users = User.all

      respond_to do |format|
       format.html # index.html.erb
       format.xml  { render :xml => @users }
      end
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @friend_projects = Project.where("user_id = ?",@user.user_id)
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    if(session[:user_id] == 0)
      @user = User.new
    else
      @user = User.find(session[:user_id])
    end


    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(session[:user_id])
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])
    if(params[:user[captcha] != 'upeckshin'])
      render :action => "new" 
      return
    end
    respond_to do |format|
      if @user.save
        session[:login_status] = 1
        session[:user_id] = @user.id
        session[:user_text_id] = @user.user_id
        session[:first_name] = @user.first_name
        session[:last_name] = @user.last_name

        format.html { redirect_to(profile_url, :alert => 'User was successfully created.') }

      else
        format.html { render :action => "new" }

      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(session[:user_id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(profile_url, :alert => 'User was successfully updated.') }

      else
        format.html { render :action => "edit" }

      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @user = User.find(params[:user_id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
end
