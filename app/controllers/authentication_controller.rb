class AuthenticationController < ActionController::Base

  def authenticate
    username = params[:username]
    password = params[:password]
    user = User.where(name: username)
    if user.count > 0 && user[0][:password] == password
      file = File.read(File.join(__dir__ , '../models/authenticated_user.json'))
      render :json => JSON.parse(file), status: 200
    else
      render :json => {:error => 'please provide the username'}, status: 500
    end
  end
end