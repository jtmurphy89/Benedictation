Rails.application.routes.draw do

  root              'static_pages#home'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'chat' => 'static_pages#chat'
  get 'video' => 'static_pages#video'
  get 'newgroup' => 'groups#new'
  get 'giraffe' => 'static_pages#giraffe'
  get 'speechrec' => 'static_pages#speechrec'
  get '/room/:id/:name' => 'rooms#room'
  get 'newuser/:id/' => 'groups#newuser'
  post 'newuser/:id/', :to => "groups#adduser"
  post 'chat', :to => "groups#popupadduser"
  post 'groups', :to => "groups#create"
  post '/check_api' => "rooms#api_help"
  post '/update_redis' => "groups#update_redis"
  get '/get_redis' => "groups#get_redis"
  get '/clear_redis' => "groups#clear_redis"
  get '/get_most_recent_email' => "groups#get_most_recent_email"
  get '/get_redis_item' => "groups#get_redis_item"
  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resources :relationships,       only: [:create, :destroy]
  
  #root to: "home#show"
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
