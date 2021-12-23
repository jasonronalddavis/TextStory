class Api::V1::UsersController < ApplicationController

before_action :authorized, only: [:auto_login]



    def index
        users = User.all
        render json: users, include: ['story_texts']
        # or
#        binding.pry 
    end



def create
@user = User.create(user_params)
if @user.valid?
    token = encode_token({user_id: @user.id})
    render json: {user: @user, token: token}
else
    render json: {error: "invalid usernameor password"}
end
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
        @user = User.new(user_params)
        render json: @user
       # binding.pry  
     end

     
def auto_login
    render json: @user
end
  
    private
    
        def user_params 
        params.permit(:id, :name, :password, :category_id, :story_text_id, :comment_id)
          
    end
    

end

