class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  after_filter :set_csrf_token
  
  helper_method :current_user, :signed_in?, :countries
  
  def set_csrf_token
  	if protect_against_forgery?
      cookies['X-CSRF-Token'] = form_authenticity_token
    end
  end
  
#  def post_data
# 		params.require('data')
#  end

	def current_user
		if not cookies[:doctor_id].nil?
			@current_user ||= Doctor.find(cookies[:doctor_id])
		else
			@current_user = nil
		end
	end	
	
	def sign_in(user)
		cookies[:doctor_id] = user.id
	end
	
	def sign_out
		cookies.delete(:doctor_id)
	end
	
	def signed_in?
		if current_user
			return true
		end
		return false
	end
	
	def root
		if request.subdomain == 'central'
			redirect_to controller: 'hcncentral', action: 'index'
		else
			if signed_in?
				redirect_to controller: 'doctors', action: 'dashboard'
			else
				redirect_to controller: 'staticpages', action: 'index'
			end
		end
	
	end
	
	def countries
	  @countries = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus rhoncus et elit et consectetur. Sed rhoncus congue ante, vel sollicitudin nisi bibendum vitae. Aenean molestie lorem in suscipit tincidunt. Phasellus sed vulputate dui. Ut ornare nisl lacus, quis interdum dolor imperdiet sed. In hac habitasse platea dictumst. Mauris quis nulla consectetur, imperdiet justo quis, gravida ex. Nulla ut tortor tempor, efficitur tortor eu, iaculis dolor. Nam et consequat velit, nec porta ante. Pellentesque habitant morbi tristique senectus et netus et.".gsub(/,|\./, '').split("\s").map {|i| i.capitalize}
	end
	
end
