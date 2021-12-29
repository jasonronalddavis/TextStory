class Api::V1::UsersController < ApplicationController

before_action :authorized, only: [:auto_login]



    def index
        users = User.all
        render json: users, include: ['story_texts']
        UserSerializer.new(users).to_serialized_json(:story_texts, :errors)
    #  binding.pry 
    end






    def login
    @user = User.find_by(name: parmas[:name])

    if @user && @user.authenticate(parmas[:password])
        token = encode_token({user_id: @user.id})
        render json: {user: @user, token: token}
    else
        render json: {error: "Invalid username or password"}
    end  
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
        @user = User.create(user_params)
        if @user.valid?
            session[:user_id] = @user.id
          render json: @user, status: :created
        else
            render json: {error: "invalid username or password"}
        end
        end





    private
    
        def user_params 
        params.permit(:id, :name, :password, :category_id, :story_text_id, :comment_id)
          
    end
    

end

