class Api::V1::SessionsController < ApplicationController
 




   def create
 user = User.find_by_name(params[:name])
 if user&.authenticate(params[:password])
  session[:user_id] = user.id

render json user, status: :okay
 else
  render json: "invalid", status:
  :unauthorized
end
end


    def destroy 
      session.delete :user_id
        
    end
    

  end