class Api::V1::Admin::UsersController < ApplicationController



    def index
        users = User.all
        render json: users
     

        
    end

     def show
        user = User.find_by_id(params[:id])
        render json: user
     end
     


    private
    
        def category_params 
        params.require(:user).permit( :id, :name, :category_id, :story_text_id, :comment_id)
        end



end
