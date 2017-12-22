Rails.application.routes.draw do
  get "likes" => 'likes#index'
  get "likes/new" => 'likes#new'
  get "ideas/:id/likes" => 'likes#create'
  get "likes/:id" => 'likes#show'
  get "likes/:id/edit" => 'likes#edit'
  patch "likes/:id" => 'likes#update'
  delete "likes/:id" => 'likes#delete'

  get "ideas" => 'ideas#index'
  get "ideas/new" => 'ideas#new'
  post "ideas" => 'ideas#create'
  get "ideas/:id" => 'ideas#show'
  get "ideas/:id/edit" => 'ideas#edit'
  patch "ideas/:id" => 'ideas#update'
  delete "ideas/:id" => 'ideas#delete'

  get "users" => 'users#index'
  get "users/new" => 'users#new'
  post "users" => 'users#create'
  get "users/:id" => 'users#show'
  get "users/:id/edit" => 'users#edit'
  patch "users/:id" => 'users#update'
  delete "users/:id" => 'users#delete'

  root 'sessions#new'
  post "sessions/create" => 'sessions#create'
  delete 'sessions/:id' => 'sessions#destroy'
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
