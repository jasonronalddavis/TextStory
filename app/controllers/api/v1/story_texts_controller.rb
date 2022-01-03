class Api::V1::StoryTextsController < ApplicationController
    
    before_action :authorized, only: [:auto_login]
    
    
    def index
        @story_texts = StoryText.all
      #  render json: @story_texts, include: ['categories', 'users']
     render json: StoryTextSerializer.new(@story_texts)

        
    end

     def show
        story_text = StoryText.find_by_id(params[:id])
        render json: story_text
     end
     


    private
    
        def category_params 
        params.require(:story_text).permit( :id, :name, :description, :category_id, :user_id, :comment_id)
        end




end
