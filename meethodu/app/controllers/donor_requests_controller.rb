class DonorRequestsController < ApplicationController
  # GET /donor_requests
  # GET /donor_requests.xml
  def index
    @donor_requests = DonorRequest.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @donor_requests }
    end
  end

  # GET /donor_requests/1
  # GET /donor_requests/1.xml
  def show
    @donor_request = DonorRequest.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @donor_request }
    end
  end

  # GET /donor_requests/new
  # GET /donor_requests/new.xml
  def new
    @donor_request = DonorRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @donor_request }
    end
  end

  # GET /donor_requests/1/edit
  def edit
    @donor_request = DonorRequest.find(params[:id])
  end

  # POST /donor_requests
  # POST /donor_requests.xml
  def create
    @donor_request = DonorRequest.new(params[:donor_request])

    respond_to do |format|
      if @donor_request.save
        format.html { redirect_to(@donor_request, :notice => 'Donor request was successfully created.') }
        format.xml  { render :xml => @donor_request, :status => :created, :location => @donor_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @donor_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /donor_requests/1
  # PUT /donor_requests/1.xml
  def update
    @donor_request = DonorRequest.find(params[:id])

    respond_to do |format|
      if @donor_request.update_attributes(params[:donor_request])
        format.html { redirect_to(@donor_request, :notice => 'Donor request was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donor_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /donor_requests/1
  # DELETE /donor_requests/1.xml
  def destroy
    @donor_request = DonorRequest.find(params[:id])
    @donor_request.destroy

    respond_to do |format|
      format.html { redirect_to(donor_requests_url) }
      format.xml  { head :ok }
    end
  end
end
