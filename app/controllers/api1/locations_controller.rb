class Api1::LocationsController < ApplicationController


  # GET LAST LOCATIONS
  def get_all_closer_to_user
  	@data = Hash.new    
	@data[:locations] = Location.get_all_closer_to_user
  end

  # SET LAST LOCATION
  def set_location_user
  	
  	@data = Hash.new    
	@data[:locations] = Location.get_all_closer_to_user
  end
  

end