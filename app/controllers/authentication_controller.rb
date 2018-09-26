class AuthenticationController < ActionController::Base

  def authenticate
    username = params[:username]
    password = params[:password]
    if username.nil? || password.nil?
      render :json => {:error => 'please provide the username'}, status: 500
    else
      file = File.read(File.join(__dir__ , '../models/authenticated_user.json'))
      render :json => JSON.parse(file), status: 200
    end
  end
end