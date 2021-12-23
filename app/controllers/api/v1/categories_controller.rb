class Api::V1::CategoriesController < ApplicationController



    def index
        categories = Category.all
        render json: categories
     

        
    end

     def show
        category = Category.find_by_id(params[:id])
        render json: category
     end
     


    private
    
        def category_params 
        params.require(:category).permit( :id, :name, :story_text_id, :user_id, :comment_id)
        end

end
