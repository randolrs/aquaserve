Rails.application.routes.draw do
  
  resources :service_requests

  root 'pages#home'

  get '/tank_information/:id' => 'service_requests#tank_information', as: 'tank_information'

  get '/contact_information/:id' => 'service_requests#contact_information', as: 'contact_information'

  get '/requested_services/:id' => 'service_requests#requested_services', as: 'requested_services'

  get '/quotes/:id' => 'service_requests#quotes', as: 'service_quotes'

  post 'initiate_quote' => 'service_requests#initiate_quote', as: 'initiate_quote'

  post 'service_requests/update_tank_details/:id' => 'service_requests#update_tank_details', as: 'update_tank_details'

  post 'service_requests/update_requested_services/:id' => 'service_requests#update_requested_services', as: 'update_requested_services'

  post 'service_requests/update_contact_information/:id' => 'service_requests#update_contact_information', as: 'update_contact_information'


  #get 'about' => 'pages#about'

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
