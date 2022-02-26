Rails.application.routes.draw do
  root to: 'application#welcome'  
 

#ASIDE FROM APPLICATION CONTROLLER, ALL ROUTES/CONTROLLERS ARE NAMESPACED UNDER API/V1
  namespace :api do
   namespace :v1 do



#ADMIN FUNCTIONALITY NOT YET IMPLEMENTED LEFT FOR EXTENDED FUNCTIONALITY
    namespace :admin do
      root to: 'application#welcome'  

      resources :users do
      resources :story_texts
      resources :categories
      resources :comments
    end
  
    resources :story_texts do
  
    resources :users
    resources :categories
    end
  
    resources :categories do
    resources :users
    resources :story_texts
   
  end


  resources :comments do
  
    resources :users
    resources :story_texts
    resources :categories
   
  end
end



#SESSION ROUTES 
get 'signup', to: 'sessions#signup'
#SIGNUP POSTS TO USERS CREATE
post 'signup', to: "users#create"
get 'login'
post 'login', to: 'sessions#create'
get'get_current_user', to: 'sessions#get_current_user'
delete 'logout', to: 'sessions#destroy'


get 'story_texts/create', to: 'story_texts#create'
post 'story_texts/create', to: 'story_texts#create'

#USERS DELETE NOT YET IMPLEMENTED
delete 'users/delete', to: 'users#destroy'
#ONLY USED FOR USER AUTH SIGNUP
 devise_for :users
 resources :users do
    resources :story_texts
    resources :categories
  end


get 'user_story_texts', to: 'user_story_texts#index'




  resources :story_texts 

  resources :images

  resources :categories 
 
 
end
end
end