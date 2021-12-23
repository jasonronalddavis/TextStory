

class Api::V1::Admin::ApplicationController < ApplicationController




    def welcome    
        users = User.all
        render json: users
        end


end
