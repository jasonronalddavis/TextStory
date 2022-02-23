Rails.application.routes.draw do
  root to: 'application#welcome'  
 
  namespace :api do
   namespace :v1 do




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




get 'signup', to: 'sessions#signup'
post 'signup', to: "users#create"
get 'login'
post 'login', to: 'sessions#create'
get'get_current_user', to: 'sessions#get_current_user'
delete 'logout', to: 'sessions#destroy'


get 'story_texts/create', to: 'story_texts#create'
post 'story_texts/create', to: 'story_texts#create'


delete 'users/delete', to: 'users#destroy'


 devise_for :users

  resources :users do
    resources :story_texts
    resources :categories
  end

  resources :images

  resources :story_texts 


  resources :categories 
 
 
end
end
end