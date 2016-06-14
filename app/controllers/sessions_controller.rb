class SessionsController < ApplicationController

	def new
		render 'new'#, layout: 'sign_in'
	end
	
	def create
		params.permit(:email, :password)
		@doctor = Doctor.find_by(email: params[:email].downcase)
		
		if not @doctor.nil?
			@doctor = @doctor.authenticate params[:password]
			
			if @doctor
				sign_in @doctor
				redirect_to dashboard_path and return
			end
		end
		
		render 'new'
	end
	
	def destroy
		sign_out
		
		redirect_to root_path
	end

end
