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





    def login
      @user = User.find_by(name: params[:name])
      if @user && @user.authenticate(params[:password])
          token = encode_token({user_id: @user.id})
         
          render json: {user: @user, token: token}
      else
          render json: {error: "Invalid username or password"}
      end  
      end

def signup
  @user = User.find_by(name: params[:name])
  if @user
  token = encode_token({user_id: @user.id})
  render json: {user: @user, token: token}
else
  render json: {error: "Invalid username or password"}
end  
end




def get_user_stories
  binding.pry
  user = current_user
  @user_story_texts = user.story_texts
  @user_story_images = @user_story_texts.map {|s| s.images}
end




    def get_current_user
      if logged_in?
        #binding.pry
        @user =  current_user
        @user_story_texts = @user.story_texts
        @user_story_images = @user_story_texts.map {|s| s.images}
        render json: UserSerializer.new(current_user)
      else
        render json: {
          error: "Not logged in"
        }
      end
    end
   






    def destroy 
      session.clear
      render json: {
        notice: "Not logged in"
      }
    end
    

    def session_params 
      # binding.pry
      params.require(:session).permit(:user_id, :id, :password, :name)   
    end

  end

