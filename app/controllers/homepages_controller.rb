class HomepagesController < ApplicationController
  def index
    render layout: "homepage"
  end

  def get_current_user
    @user = User.find_by(id: session[:user_id])
    return @user
  end 
end
