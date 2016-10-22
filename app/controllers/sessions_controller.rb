class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    redirect_to root_path unless auth_hash['uid']

    @user = User.find_by(uid: auth_hash[:uid], provider: 'github')

    # User doesn't match anything in the DB.
    # Attempt to create a new user.
    if @user.nil?
      @user = User.build_from_github(auth_hash)
      render :creation_failure unless @user.save
    end

    # save the user's id to persist in sessions. somehow the sessions persist across requests, like params but better.
    session[:user_id] = @user.id

    redirect_to index_path
  end

  def index
    @user = User.find(session[:user_id])
    # recalls the value set in a previous request
  end

  def destroy
    session[:user_id] = nil
  end 
end
