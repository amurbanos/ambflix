class Admin::ApplicationController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :authorize_request, except: [:login, :do_login, :new]
  
  layout "admin"

  def not_found
	render json: { error: 'not_found' }
  end

  def authorize_request
	header = session[:auth] 
	ap session[:auth] 
	begin
	  @decoded = JsonWebToken.decode(header)
	  @current_user = User.find(@decoded[:user_id])
	rescue ActiveRecord::RecordNotFound => e
	  redirect_to controller: "users", action: "login"
	rescue JWT::DecodeError => e
	  redirect_to controller: "users", action: "login"
	end
  end

end