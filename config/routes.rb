LhlPogorider::Application.routes.draw do

  resources :rides, only: [:index, :show] do
    resources :passengers
  end

  resource :session, only: [:new, :create, :destroy]

  namespace :my do
    resources :rides do
      collection do
        get "requests"
        get "drives"
      end
      member do
        get "add_me_to_ride"
        delete "remove_driver"
        get "add_driver"
        get "accept_passenger"
        get "reject_passenger"
      end
    end
    resources :users, except: [:new, :create, :destroy, :index], :path => "profile"
  end
  resources :users, except: [:index, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  root to: "static#index"

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
