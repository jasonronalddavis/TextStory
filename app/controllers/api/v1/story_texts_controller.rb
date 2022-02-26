class Api::V1::StoryTextsController < ApplicationController


#LISTS ALL STORIES TO BE ACQUIRED BY FRONT END.
    def index   
        @story_text = StoryText.all
        render json: StoryTextSerializer.new(@story_text)
    end


#NOT YET IMPLEMENTED
        def show
            @story_text = StoryText.find_by_id(params[:id])
            render json: @story_text
         end
   



     def create
     # binding.pry
       if current_api_v1_user
        @user = current_api_v1_user
        @image = Image.new(url: params[:image_file])
        #SETTING IMAGE INSTANCE BY URL NAME AND SAVING IT TO USER RELATION USER.IMAGES
        @category = Category.find_by_name(params[:categories])
         #ASSIGNING CATEGORY INSTANCE BY NAME AND SAVING IT TO USER RELATION USER.CATEGORIES
        @story_text = StoryText.new(story_text_params)
        #ASSIGNING STORYTEXT INSTANCE BY NAME AND SAVING IT TO USER RELATION USER.STORYTEXT
        @story_text.categories << @category
        @story_text.images << @image
        @user.story_texts << @story_text
        @user.images << @image
         if @story_text.save      
           render json: @story_text, status: :created
         else
             render json: {error: "invalid name or password"}
         end
     elsif !current_api_v1_user
         render json: {error: "must be logged in"}  
    end
end



    private

        def story_text_params 
        params.require(:story_text).permit(:name, :id, :description, :text_content, :user_id)    
    end
    

end
 