class ServiceRequestsController < ApplicationController
  before_action :set_service_request, only: [:show, :edit, :update, :destroy]

  # GET /service_requests
  # GET /service_requests.json
  def index
    @service_requests = ServiceRequest.all
  end



  def tank_information

    @request_step = "tank_information"

    if ServiceRequest.where(:id => params[:id]).exists?

      @service_request = ServiceRequest.find(params[:id])

    else

      redirect_to root_path

    end


  end


  def quotes

    @request_step = "service_quotes"

    @contact_information_completed = true

    @tank_details_completed = true


  end





  def contact_information

    @request_step = "contact_information"

    @tank_details_completed = true

  end



  def update_contact_information

    if ServiceRequest.where(:id => params[:id]).exists?

      @service_request = ServiceRequest.find(params[:id])

      @service_request.update(:email => params[:email], :phone_number => params[:phone_number], :full_name => params[:full_name])

      redirect_to service_quotes_path

    else

      redirect_to root_path

    end

    


  end



  def update_tank_details

    if params[:id]

      if ServiceRequest.where(:id => params[:id]).exists?

        @service_request = ServiceRequest.find(params[:id])

        @service_request.update(:gallons_in_tank => params[:gallons_in_tank], :salt_water => true)

        redirect_to requested_services_path(@service_request.id)

      else

        root_path

      end

    else

      root_path

    end

  end



  def update_requested_services


    if ServiceRequest.where(:id => params[:id]).exists?

      @service_request = ServiceRequest.find(params[:id])

      @service_request.update(:gallons_in_tank => params[:gallons_in_tank])

      redirect_to requested_services_path


    else

      redirect_to root_path
      
    end


  end




  def requested_services

    @request_step = "requested_services"

    if ServiceRequest.where(:id => params[:id]).exists?

      @service_request = ServiceRequest.find(params[:id])

    else

      redirect_to root_path
      
    end


  end


  # GET /service_requests/1
  # GET /service_requests/1.json
  def show
  end

  # GET /service_requests/new
  def new
    @service_request = ServiceRequest.new
  end

  # GET /service_requests/1/edit
  def edit
  end

  # POST /service_requests
  # POST /service_requests.json
  def create
    @service_request = ServiceRequest.new(service_request_params)

    respond_to do |format|
      if @service_request.save
        format.html { redirect_to contact_information_path(@service_request.id), notice: 'Service request was successfully created.' }
        format.json { render :show, status: :created, location: @service_request }
      else
        format.html { render :new }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_requests/1
  # PATCH/PUT /service_requests/1.json
  def update
    respond_to do |format|
      if @service_request.update(service_request_params)
        format.html { redirect_to @service_request, notice: 'Service request was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_request }
      else
        format.html { render :edit }
        format.json { render json: @service_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_requests/1
  # DELETE /service_requests/1.json
  def destroy
    @service_request.destroy
    respond_to do |format|
      format.html { redirect_to service_requests_url, notice: 'Service request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_request
      @service_request = ServiceRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_request_params
      params.require(:service_request).permit(:email, :zip_code, :gallons_in_tank, :salt_water, :phone_number, :full_name)
    end
end
