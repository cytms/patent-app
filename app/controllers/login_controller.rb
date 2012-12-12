class LoginController < ApplicationController
  before_filter :authenticate_user!
  def index
  	#@result = Model.find.email
  	#redirect_to "../"
  end
  def logout
    sign_out :user
  end
end