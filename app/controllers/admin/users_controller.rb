class Admin::UsersController < Admin::ApplicationController

  # LIST USERS     
  def indexx
  end  

  # SET LOGIN     
  def login
    render layout: "admin_login"
  end

  # DO LOGIN     
  def do_login
    user = User
      .where("email"  => params[:user][:email])      
      .where("status" => 1)     
      .first 
    #
    @data = Hash.new
    if user&.authenticate(params[:user][:password])
      session[:auth]  = JsonWebToken.encode(user_id: user.id)
      @data[:time]    = Time.now + 24.hours.to_i
      flash[:success] = "Logado com sucesso"
      redirect_to action: "index"
    else
      flash[:error] = "Erro ao logar"
      render "login", layout: "admin_login"
    end
  end


end