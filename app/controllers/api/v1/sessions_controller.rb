class Api::V1::SessionsController < ApplicationController






  def create
  @user = User.find_by_name(params[:name])
 if @user && @user.authenticate(params[:password])
     session[:user_id] = @user.id
     render json: UserSerializer.new(@user)
 else
  render :action => 'invalid', formats: [:json]
        binding.pry
      end
    end

    def destroy 
      session.delete :user_id
        
    end
    

    def session_params 
      # binding.pry
      params.permit(:sessions, :user_id, :id, :password, :name)   
    end

  end

