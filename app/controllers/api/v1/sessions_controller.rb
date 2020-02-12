class Api::V1::SessionsController < ApplicationController
    # skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(username: login_params[:username])
    # byebug
    if (@user && @user.authenticate(login_params[:password]))
        # byebug
      token = JWT.encode({user_id: @user.id}, ENV['KEY'], 'HS256')
      render json: { token: token }, status: :ok
    else
      render json: { msg: "Login failed.." }
    end
  end


  private
  def login_params
    params.require(:user).permit(:username,:password)
  end

end
