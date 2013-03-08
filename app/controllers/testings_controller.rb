class TestingsController < ApplicationController
  # GET /testings
  # GET /testings.json
  def index
    @testings = Testing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @testings }
    end
  end

  # GET /testings/1
  # GET /testings/1.json
  def show
    @testing = Testing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @testing }
    end
  end

  # GET /testings/new
  # GET /testings/new.json
  def new
    dvp_id = params[:dvp_id]
    @dvp = Dvp.find(dvp_id)
    @testing = @dvp.testings.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @testing }
    end
  end

  # GET /testings/1/edit
  def edit
    @testing = Testing.find(params[:id])
  end

  # POST /testings
  # POST /testings.json
  def create
    @testing = Testing.new(params[:testing])
    @testing.requested_by = current_user
    @testing.requested_at = DateTime.now

    respond_to do |format|
      if @testing.save
        p 'Testing save', @testing.id, @testing.dvp.id
        format.html { redirect_to session[:original_uri], notice: 'Testing was successfully created.' }
        format.json { render json: @testing, status: :created, location: @testing }
      else
        p 'Testing now save'
        format.html { render action: "new" }
        format.json { render json: @testing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /testings/1
  # PUT /testings/1.json
  def update
    @testing = Testing.find(params[:id])
    @testing.tested_at = DateTime.now
    @testing.tested_by = current_user
    @testing.save
    respond_to do |format|
      if @testing.update_attributes(params[:testing])
        format.html { redirect_to session[:original_uri], notice: 'Testing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @testing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testings/1
  # DELETE /testings/1.json
  def destroy
    @testing = Testing.find(params[:id])
    @testing.destroy

    respond_to do |format|
      format.html { redirect_to testings_url }
      format.json { head :no_content }
    end
  end



end
