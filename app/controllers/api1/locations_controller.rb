class Api1::LocationsController < ApplicationController


  # THIS GET LAST LOCATIONS BY USAR  
  def index
    user = User
      .where("status" => 1)       
      .where("level" => 4)     
      .first 
    @data = Hash.new    
    @data[:user] = user  
  end
  

end