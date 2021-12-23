class Api::V1::CommentsController < ApplicationController


    def index
        comments = Comment.all
        render json: comments
     

        
    end

     def show
        comment = Comment.find_by_id(params[:id])
        render json: comment
     end
     


    private
    
        def category_params 
        params.require(:comment).permit( :id, :name, :category_id, :story_text_id, :user_id)
        end


end
