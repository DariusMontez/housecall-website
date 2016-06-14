class Doctor < ActiveRecord::Base

	has_secure_password

	has_many :appointments
	has_many :patients, through: :appointments
	
	before_save {|doctor| doctor.email = doctor.email.downcase if doctor.email}

	validates :email, presence: true, uniqueness: {case_sensitive: false}
	
	validates :name, presence: true
	
	validates :password, presence: true, on: [:new, :create]
	
	validates :password_confirmation, presence: true, on: [:new, :create]
	
end
