class Api1::LocationsController < ApplicationController


  # THIS GET LAST LOCATIONS
  def get_all_closer_to_user
  	@data = Hash.new    
	@data[:locations] = Location.get_all_closer_to_user
  end
  

end