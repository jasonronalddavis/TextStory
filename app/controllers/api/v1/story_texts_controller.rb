class Api::V1::StoryTextsController < ApplicationController



    def index   
        @story_text = StoryText.all
        render json: StoryTextSerializer.new(@story_text)
    end






        def show
            @story_text = StoryText.find_by_id(params[:id])
            render json: @story_text
         end
   



     def create
     # binding.pry
       if session[:user_id]
        @user = User.find(session[:user_id])
        #SETTING IMAGE INSTANCE BY URL NAME AND SAVING IT TO USER RELATION USER.IMAGES
        @image = Image.new(url: params[:image_file])
        @category = Category.find_by_name(params[:categories])
        @story_text = StoryText.new(story_text_params)
        @story_text.categories << @category
        @story_text.images << @image
        @user.story_texts << @story_text
        @user.images << @image
         if @story_text.save
           render json: @story_text, status: :created
         else
             render json: {error: "invalid name or password"}
         end
     elsif session[:user_id] = nil
         render json: {error: "must be logged in"}  
    end
end



    private


    
        def story_text_params 
        params.require(:story_text).permit(:name, :id, :description, :text_content, :user_id)    
    end
    

end
 