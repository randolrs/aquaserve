class PagesController < ApplicationController
  
  def home

  	@service_request = ServiceRequest.new

  	@request_step = "tank_details"

  	@service_request.salt_water = true

  end

  def waitlist

  	#@waitlist_entry = WaitlistEntry.new

  end

  def waitlist_signup

  	waitlist_entry = WaitlistEntry.create(:email => params[:email], :zip_code => params[:zip_code])

	flash[:message] = "Thanks for signing up! We will email you when we come to your area."

  	redirect_to waitlist_path

  end

end
