Rails.application.routes.draw do
  namespace :api do
   namespace :v1 do

   root to: 'application#welcome'  






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





  resources :users do
    
    resources :story_texts
    resources :categories
  end

  resources :story_texts do

  resources :users
  resources :categories
  end

  resources :categories do

  resources :users
  resources :story_texts
 
  end
end
end
end