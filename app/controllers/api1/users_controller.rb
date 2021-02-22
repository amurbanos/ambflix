class Api1::UsersController < ApplicationController

  # THIS METHOD SET LOGIN   
  def index
    user = User
      .select('id', 'name')
      .where("status" => 1)       
      .where("level" => 4)     
      .first 
    @data = Hash.new    
    @data[:user]   = user  
    @data[:config] = Rails.configuration.ambflix  

  end

  #    
  def login
     
  end

end