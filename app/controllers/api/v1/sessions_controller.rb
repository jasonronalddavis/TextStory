class Api::V1::SessionsController < ApplicationController

#SWITCHING FROM CUSTOM AUTH TO DEVISE. STILL LEARNING DEVISE


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
      @user = current_api_v1_user
      if @user 
        render json: UserSerializer.new(@user)
       #   render json: {user: @user, message: "signed_in"}
      else
          render json: {error: "Invalid username or password"}
      end  
      end



#ROUTED TO USERS CREATE
def signup
  @user = User.find_by(name: params[:name])
  if @user
  #  token = encode_token({user_id: @user.id})
   # render json: {user: @user, token: token}
   render json: UserSerializer.new(@users) 
  else
  render json: {error: "Invalid username or password"}
end  
end



    def get_current_user
        @user = current_api_v1_user
        sign_in(@user)
        if @user
        render json: UserSerializer.new( @user)
       # binding.pry
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
    

    #MAY NOT USE SANITIZED SESSION PARAMS. LEAVING FOR POTENTIAL USE
    def session_params 
      # binding.pry
      params.require(:session).permit(:user_id, :id, :password, :name)   
    end

  end

