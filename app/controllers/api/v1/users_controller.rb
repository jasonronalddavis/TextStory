class Api::V1::UsersController < ApplicationController



    def index
        users = User.all
        render json: UserSerializer.new(users)
    #  binding.pry 
    end






     def show
        if current_user
        render json: current_user, status: :ok
        else
            render json: "Not authenticated", status:
            :unauthorized
        end
     end




     def create
      #  binding.pry
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
          render json: @user, status: :created
        else
            render json: {error: "invalid name or password"}
        end
    end





    private
    
        def user_params 
        params.require(:user).permit(:name, :password, :id, :image_ids, :category_ids, :comment_ids)    
    end
    

end

