class Api::V1::UsersController < ApplicationController



    def index
        users = User.all     
        render json: UserSerializer.new(users)
    #  binding.pry 
    end






     def show
        if current_api_v1_user
        render json: current_user, status: :ok
        else
            render json: "Not authenticated", status:
            :unauthorized
        end
     end





     def create
#binding.pry
        @user = User.new(user_params)
        if @user.save
          sign_in(@user)
   render json: @user, status: :created
        else
            render json: {error: "invalid name or password"}
        end
    end



    def destroy 
        binding.pry
        @user = User.find_by(name: params[:name])
@user.delete
        render json: {
          notice: "Not logged in"
        }
      end



    private
    
        def user_params 
        params.require(:user).permit(:name, :password, :id, :image_ids, :category_ids, :comment_ids)    
    end
    

end

