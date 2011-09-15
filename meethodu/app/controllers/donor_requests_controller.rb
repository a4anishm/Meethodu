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
    @donor_request = DonorRequest.new
    @donor_request.project_id = params[:project][:id]
    @donor_request.sent_user_id = session[:user_text_id]
    @donor_request.sent_date = Time.now
    @donor_request.sent_money = params[:loan_amount]
    @donor_request.seen_by_receiver = false
    @donor_request.seen_by_sender = false
    @donor_request.sent = false

    respond_to do |format|
      if @donor_request.save
        format.html { redirect_to("/projects/#{params[:project][:id]}", :notice => "Thanks for your contribution. The project sponsor will soon contact you personally. Please read this carefuly. After you send your intention to contribute, the project sponsor(most likely your friend) will contact you to find a best way to send your money. After you send your money, please click on 'Money Sent' check box in your donation pages. Once the receiver gets his money and clicks received check box in his page, the transaction is treated as complete. After the project is complete, your friend will contact you to give your money back.") }
        format.xml  { render :xml => @donor_request, :status => :created, :location => @donor_request }
      else
        format.html { redirect_to("/projects/#{params[:project][:id]}", :notice => 'Sorry, You should enter an amount to contribute') }
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

  def accept
        @donor_request = DonorRequest.find(params[:id])
        @donor_request.receiver_accepted = true
        @donor_request.seen_by_receiver = true
        if @donor_request.save
          redirect_to(profile_path)
        end
  end

  def reject
        @donor_request = DonorRequest.find(params[:id])
        @donor_request.receiver_accepted = false
        @donor_request.seen_by_receiver = true
        if @donor_request.save
          redirect_to(profile_path)
        end
  end
end
