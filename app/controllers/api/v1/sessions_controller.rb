class Api::V1::SessionsController < ApplicationController


  def create
  @user = User.find_by_name(params[:name])
  #binding.pry
 if @user.valid_password?(params[:password])
     sign_in(@user)

     render json: UserSerializer.new(@user), status: :ok
    else
      "muhhh" 
    end
    end





    def login
      @user = find_current_user
      if @user 
          render json: {user: @user, message: "signe_in"}
      else
          render json: {error: "Invalid username or password"}
      end  
      end




def signup
  @user = User.find_by(name: params[:name])
  if @user

  render json: {user: @user, message: "signe_in"}
else
  render json: {error: "Invalid username or password"}
end  
end



#//--> STUCK HERE. USER KEEPS SIGNING OUT ON REFRESH <-----

    def get_current_user
        @user = current_api_v1_user
        sign_in(@user)
        if signed_in?(@user)
        render json: UserSerializer.new( @user)
      else
        render json: {
          error: "Not logged in"
        }
      end
    end
   






    def destroy 
    #  binding.pry
      sign_out(current_api_v1_user)
      render json: {
        notice: "Not logged in"
      }
    end
    

    def session_params 
      # binding.pry
      params.require(:session).permit(:user_id, :id, :password, :name)   
    end

  end

