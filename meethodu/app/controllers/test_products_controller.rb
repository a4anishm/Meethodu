class TestProductsController < ApplicationController
  # GET /test_products
  # GET /test_products.xml
  def index
    @test_products = TestProduct.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @test_products }
    end
  end

  # GET /test_products/1
  # GET /test_products/1.xml
  def show
    @test_product = TestProduct.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @test_product }
    end
  end

  # GET /test_products/new
  # GET /test_products/new.xml
  def new
    @test_product = TestProduct.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @test_product }
    end
  end

  # GET /test_products/1/edit
  def edit
    @test_product = TestProduct.find(params[:id])
  end

  # POST /test_products
  # POST /test_products.xml
  def create
    @test_product = TestProduct.new(params[:test_product])

    respond_to do |format|
      if @test_product.save
        format.html { redirect_to(@test_product, :notice => 'Test product was successfully created.') }
        format.xml  { render :xml => @test_product, :status => :created, :location => @test_product }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @test_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /test_products/1
  # PUT /test_products/1.xml
  def update
    @test_product = TestProduct.find(params[:id])

    respond_to do |format|
      if @test_product.update_attributes(params[:test_product])
        format.html { redirect_to(@test_product, :notice => 'Test product was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @test_product.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /test_products/1
  # DELETE /test_products/1.xml
  def destroy
    @test_product = TestProduct.find(params[:id])
    @test_product.destroy

    respond_to do |format|
      format.html { redirect_to(test_products_url) }
      format.xml  { head :ok }
    end
  end
end
