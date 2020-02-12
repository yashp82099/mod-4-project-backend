class ApplicationController < ActionController::API

    def current_user
        # byebug 
        token = request.headers['Access-Token']
        # byebug
        if token
            user_id = JWT.decode(token, ENV['KEY'])[0]["user_id"]
            return User.find_by(id: user_id)
        else 
            return nil
        end
      end
    
      def authenticate!
       unless current_user
          # byebug
         return nil
       end
     end

end
