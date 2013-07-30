OCS::Application.routes.draw do
 # get "iaa_s/new"
  #get "iaa_s/edit"
  match '/iaa_s/destroy', to: 'iaa_s#destroy', via: :delete
  match '/iaa_s/myfriend', to: 'iaa_s#myfriend', via: :get
  get "iaa_s/manage"
  get "iaa_s/start"
  get "iaa_s/run"
  get "iaa_s/create_image"
  get "iaa_s/stop"
  get "iaa_s/reboot"
  get "iaa_s/show"
  post "iaa_s/create"
  get '/users/edit' 
  #get '/users/displayallusers' 
   
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :iaa_s
  match '/signup', to: 'users#new', via: :get
  match '/signin', to: 'sessions#new', via: :get
  match '/displayallusers', to: 'users#displayallusers', via: :get
  match '/deltactest', to: 'users#deltactest', via: :get
  match '/signout', to: 'sessions#destroy', via: :delete



 root to: "users#home"


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
