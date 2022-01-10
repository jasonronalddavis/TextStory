class Api::V1::SessionsController < ApplicationController




  def create
  @user = User.find_by_name(params[:name])
 if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id

     render json: UserSerializer.new(@user), status: :ok
    else
      "muhhh" 
    end
    end


    def get_current_user
      if logged_in?
       # binding.pry
        render json: UserSerializer.new(current_user)
      else
        render json: {
          error: "Not logged in"
        }
      end
    end
   


    def destroy 
      session.delete :user_id
      render json: {
        error: "Not logged in"
      }
    end
    

    def session_params 
      # binding.pry
      params.require(:session).permit(:user_id, :id, :password, :name)   
    end

  end

