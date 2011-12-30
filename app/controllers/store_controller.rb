class StoreController < ApplicationController
  def index
    @time = Time.now
    @cart = current_cart
    @products = Product.order(:title)
    
    session[:visits] += 1
    
  rescue NoMethodError
    session[:visits] = 1
     
  end

end
