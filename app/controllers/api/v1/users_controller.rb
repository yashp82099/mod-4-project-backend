class Api::V1::UsersController < ApplicationController
  before_action :authenticate!, only: [:show]

    def showu 
      token = request.headers['Access-Token']
      user_id = JWT.decode(token, ENV['KEY'])[0]["user_id"]
      @user = User.find_by(id: user_id)
      # byebug
      render json: @user.to_json( :include => [:addresses, :favorites] )
    end

    


    def signup
        @user = User.new(user_params)
        if @user.valid? && @user.save
            render json: @user
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
      end
     
      private
      def user_params
        params.require(:user).permit(:username, :password, :first_name, :last_name, :zip)
      end
end
