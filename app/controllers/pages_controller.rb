class PagesController < ApplicationController
  
  def home

  	@service_request = ServiceRequest.new

  	@request_step = "tank_details"

  	@service_request.salt_water = true

  end

end
