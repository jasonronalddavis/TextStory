class Api::V1::ImagesController < ApplicationController


    
    def index
        @images = Image.all
        #binding.pry
        render json: ImageSerializer.new(@images)

    end








        def show
            @image = Image.find_by_id(params[:id])
            render json: @image
         end
     end




     def create
     
       if session[:user_id]
        @user = User.find(session[:user_id])
        @image = Image.new(story_text_params)
        render json: {message: "logged in"}
        if @image.save
            session[:story_text_id] = @image.id
          render json: @image, status: :created
        else
            render json: {error: "invalid name or password"}
        end
    elsif session[:user_id] = nil
        render json: {error: "must be logged in"}  
    end





    private
    
        def image_params 
        params.require(:image).permit(:name, :url)    
    end














end
