class Api::V1::ApplicationController < ApplicationController
    before_action :authorized
   
    def welcome 
        
        user = User.new
        story_texts = StoryText.all
        @stories = StoryText.all
           render json: user
        end



        def encode_token
            JWT.encode(payload, 'your_secret')
                 end
            
                 def auth_header
                 request.headers['Authorization']
                end
            
            
            def decoded_token
                if auth_header
                    token = auth_header.split(' ')[1]
                    # header: {'Authorization': 'Barnes <token>'}
                    begin
                        JWT.decode(token, 'yourSecret' , true, algorithm: 'HS256')
                    rescue JWT::DecodeError
                        nil
                    end
            end
        end
    end
            
            
                 def logged_in_user
            if decoded_token
                user_id = decoded_token[0]['user_id']
                @user = User.find_by(id: user_id)
                 end
                end
            
            

                 def logged_in?
                    !!logged_in_user
                 end
            

def authorized?
render json: { message: "please log in"}, status: :unauthorized unless
logged_in?
end


end
