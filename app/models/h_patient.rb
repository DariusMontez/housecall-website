class HPatient < HRecord::Base

	server_url 'http://central.housecall.tk', 8080
	
	column_families 'attr', 'data'

end
