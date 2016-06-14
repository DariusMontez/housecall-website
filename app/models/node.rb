class Node < ActiveRecord::Base
	belongs_to :location
	has_many :patients
#	validates :mac_address, unique: true
end
