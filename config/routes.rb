Rails.application.routes.draw do
  require 'sidekiq/web'
  
  apipie
  mount ActionCable.server => '/cable'
  mount Sidekiq::Web => '/sidekiq'

  mount_devise_token_auth_for 'User', at: 'api/v1/auth', controllers: { sessions: "api/v1/sessions", registrations: "api/v1/registrations" }
  
  match "password_reset" => "api/v1/users#password_reset", via: [:get]

  namespace :api do
    namespace :v1 do 
      
      resource :users, path: :account, defaults: { format: :json } do
        resources :user_devices, path: :devices, only: [:index, :create, :destroy]
        resources :user_ratings, path: :ratings, only: [:index]
      end

      resources :users, defaults: { format: :json } 

      resources :ratings do
        collection do
          get :export, defaults: { format: :csv }
        end
      end

      resources :restaurants, only: [ :index, :show, :create, :update, :destroy ] do
        member do
          post :rate
          if Rails.env.staging? || Rails.env.development?
            get :generate_ratings
          end
        end
      end
    
    end
  end
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
