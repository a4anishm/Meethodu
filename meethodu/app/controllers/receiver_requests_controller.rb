class ReceiverRequestsController < ApplicationController
  # GET /receiver_requests
  # GET /receiver_requests.xml
  def index
    @receiver_requests = ReceiverRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receiver_requests }
    end
  end

  # GET /receiver_requests/1
  # GET /receiver_requests/1.xml
  def show
    @receiver_request = ReceiverRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receiver_request }
    end
  end

  # GET /receiver_requests/new
  # GET /receiver_requests/new.xml
  def new
    @receiver_request = ReceiverRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @receiver_request }
    end
  end

  # GET /receiver_requests/1/edit
  def edit
    @receiver_request = ReceiverRequest.find(params[:id])
  end

  # POST /receiver_requests
  # POST /receiver_requests.xml
  def create
    @receiver_request = ReceiverRequest.new(params[:receiver_request])

    respond_to do |format|
      if @receiver_request.save
        format.html { redirect_to(@receiver_request, :notice => 'Receiver request was successfully created.') }
        format.xml  { render :xml => @receiver_request, :status => :created, :location => @receiver_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receiver_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /receiver_requests/1
  # PUT /receiver_requests/1.xml
  def update
    @receiver_request = ReceiverRequest.find(params[:id])

    respond_to do |format|
      if @receiver_request.update_attributes(params[:receiver_request])
        format.html { redirect_to(@receiver_request, :notice => 'Receiver request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receiver_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /receiver_requests/1
  # DELETE /receiver_requests/1.xml
  def destroy
    @receiver_request = ReceiverRequest.find(params[:id])
    @receiver_request.destroy

    respond_to do |format|
      format.html { redirect_to(receiver_requests_url) }
      format.xml  { head :ok }
    end
  end
end
