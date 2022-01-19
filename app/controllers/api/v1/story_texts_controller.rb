class Api::V1::StoryTextsController < ApplicationController
    
    
    def index
        @story_text = StoryText.all
        render json: StoryTextSerializer.new(@story_text)
    #  binding.pry 
    end








        def show
            @story_text = StoryText.find_by_id(params[:id])
            render json: @story_text
         end
     end




     def create

        binding.pry
       if session[:user_id]
        @user = User.find(session[:user_id])
        @images = params[:image_ids]
        @categories = params[:category_ids]
        @i_array = Image.all.find(@images)
        @c_array = Category.all.find(@categories)
        @story_text = StoryText.new(story_text_params)


        @c_array.each{|c| @story_text.categories << c}  
        @i_array.each{|i| @story_text.images << i} 


       
        if @story_text.save
          render json: @story_text, status: :created
        else
            render json: {error: "invalid name or password"}
        end
    elsif session[:user_id] = nil
        render json: {error: "must be logged in"}  
    end





    private
    
        def story_text_params 
        params.require(:story_text).permit(:name, :description, :id, :text_content, :image_ids, category_ids, :comment_ids, :user_ids, :user_id)    
    end
    

end
