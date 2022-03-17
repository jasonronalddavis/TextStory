class ApplicationController < ActionController::API
include ::ActionController::Cookies
#helper_method :find_current_user
#before_action :configure_permitted_parameters, if: :devise_controller?
rescue_from ActiveRecord::RecordNotFound, with:
:record_not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_record


    def welcome
        user = current_api_v1_user
        story_texts = StoryText.all
        @stories = StoryText.all
           render json: user
        end


def record_not_found(errors)
render json: errors.message, status: :not_found
end

def invalid_record(invalid)
render json: invalid.record.errors, status:
:unprocessable_entity
end
           
private


def find_current_user
   current_api_v1_user
   end
            

end
