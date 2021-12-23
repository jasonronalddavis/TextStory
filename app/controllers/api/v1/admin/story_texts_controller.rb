class Api::V1::Admin::StoryTextsController < ApplicationController

    def index
        story_texts = Story_Text.all
        render json: story_texts
     

        
    end

     def show
        story_text = Story_Text.find_by_id(params[:id])
        render json: story_text
     end
     


    private
    
        def category_params 
        params.require(:story_text).permit( :id, :name, :description, :category_id, :story_text_id, :comment_id)
        end



end
