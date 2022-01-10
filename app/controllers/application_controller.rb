class ApplicationController < ActionController::API
include ::ActionController::Cookies



rescue_from ActiveRecord::RecordNotFound, with:
:record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record


    def welcome 
        
        user = User.new
        story_texts = StoryText.all
        @stories = StoryText.all
           render json: user
        end

def current_user
User.find_by(id: session[:user_id])
end

def record_not_found(errors)
render json: errors.message, status: :not_found
end

def invalid_record(invalid)
render json: invalid.record.errors, status:
:unprocessable_entity
end

            

                 def logged_in?
                    !!current_user
                 end
            

def authorized?
render json: { message: "please log in"}, status: :unauthorized unless
logged_in?
end 
end
