class Admin::ProductsController < Admin::ApplicationController

  # LIST USERS     
  def index
    products = Product.all
    @data = Hash.new
    @data[:products] = products
  end  

  # ADD USERS     
  def new
  	render "add"
  end 

  def add
  end  

end