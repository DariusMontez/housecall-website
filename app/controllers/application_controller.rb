class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  after_filter :set_csrf_token
  
  helper_method :current_user, :signed_in?
  
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
	
end
