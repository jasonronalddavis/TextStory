class Api::V1::UserStoryTextsController < ApplicationController



    def index
         user = current_api_v1_user  
         user_story_texts = user.story_texts  
     #   binding.pry 
         render json: StoryTextSerializer.new(user_story_texts)
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









end
