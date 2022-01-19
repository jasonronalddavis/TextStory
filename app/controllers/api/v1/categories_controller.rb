class Api::V1::CategoriesController < ApplicationController



    def index
        @categories = Category.all
        render json: @categories
     

        
    end

     def show
        @category = Category.find_by_id(params[:id])
        render json: @category
     end
     


    private
    
        def category_params 
        params.require(:category).permit( :id, :name, :image_ids, user_ids, :story_text_ids, :comment_ids)
        end

end
