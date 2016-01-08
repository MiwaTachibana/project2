Rails.application.routes.draw do



#posts

  root 'posts#index'
  get 'posts' => 'posts#index', as: :posts
  
  post 'posts' => 'posts#create'

  get 'posts/new' => 'posts#new', as: :new_post

  get 'posts/:id/edit' => 'posts#edit', as: :edit_post

  get 'posts/:id' => 'posts#show', as: :post

  get 'usersindex' => 'posts#usersindex', as: :posts_usersindex

  put 'posts/:id' => 'posts#update'

  delete 'posts/:id' => 'posts#destroy'


  #users

 
  
  get 'users/index' => 'users#index'



  get 'users/myposts' => 'users#myposts'

  get 'users/new' => 'users#new', as: :new_user

  post 'users/' => 'users#create'

  get 'users/:id' => 'users#show', as: :user

  get 'users/:id/edit' => 'users#edit', as: :edit_user

  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  #sessions
  get 'login' => 'sessions#new', as: :login_form

  post 'sessions/create' => 'sessions#create'

  delete 'logout' => 'sessions#destroy' 



  resources :posts
  resources :users

  # get 'login', to: 'sessions#new'
  # delete "logout", to: "sessions#destroy"
  resources :sessions

  #  root 'users#index'
  # get '/users' => 'users#index', as: :users

  # post '/users' => 'users#create'

  # get '/users/new' => 'users#new', as: :new_user

  # get '/users/:id/edit' => 'users#edit', as: :edit_user

  # get '/users/:id' => 'users#show', as: :user

  # put '/users/:id' => 'users#update'

  # delete '/users/:id' => 'users#destroy'

  # get '/users/about' => 'users#about', as: :users_about

  # #sessions

  # get '/sessions' => 'sessions#index'

  # post '/sessions' => 'sessions#create'

  # get 'login' => 'sessions#new', as: :new_session

  # get '/sessions/:id/:edit' => 'sessions#edit', as: :edit_session

  # get '/session/:id' => 'session#show', as: :session

  # put '/sessions/:id' => 'session#update'

  # delete 'logout' => 'session#destroy'






  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
