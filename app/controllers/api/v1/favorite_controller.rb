class Api::V1::FavoriteController < ApplicationController


    def index 

        token = request.headers['Access-Token']
        user_id = JWT.decode(token, ENV['KEY'])[0]["user_id"]
        user = User.find_by(id: user_id)

        favorite = user.favorites

        render json: favorite

    end

    def create 
        # @favorite = Favorite.create(favorite_params)
        
        token = request.headers['Access-Token']
        user_id = JWT.decode(token, ENV['KEY'])[0]["user_id"]
        @fav = Favorite.create(name: favorite_params['name'],place_id: favorite_params['place_id'], user_id: user_id)
        render json: @fav
    end


    def remove
        token = request.headers['Access-Token']
        user_id = JWT.decode(token, ENV['KEY'])[0]["user_id"]
        @fav = Favorite.find_by(user_id: user_id, place_id: favorite_params['place_id'])
        @fav.destroy
        render json: @fav
        
    end

    private 

    def favorite_params
        params.require(:favorite).permit(:place_id, :name)
    end

end
