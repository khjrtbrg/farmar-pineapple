Rails.application.routes.draw do

  root "home#index"

  get  "/vendors",           to: "vendors#index"

  get  "/signup",            to: "vendors#new"
  post "/vendors",           to: "vendors#create"

  get  "/login",             to: "sessions#index"
  post "/login",             to: "sessions#create"

  get  "/dashboard",         to: "vendors#show"
  get  "/edit",              to: "vendors#edit"
  post "/edit",              to: "vendors#update"
  get  "/delete",            to: "vendors#destroy"

  get  "/add-products",      to: "products#index"
  post "/add-products",      to: "products#create"
  get  "/product/:id/edit",  to: "products#edit"
  post "/product/edit",      to: "products#update"
  get  "/product/:id/delete", to: "products#destroy"
  get  "/product/:id",       to: "products#redirect"

  get  "/add-market",        to: "markets#new"
  post "/add-market",        to: "markets#create"
  get  "/edit-markets",      to: "markets#edit_prep"
  post "/edit-markets",      to: "markets#edit_post"
  get  "/market/:id/edit",   to: "markets#edit"
  post "/market/edit",       to: "markets#update"
  get  "/market",            to: "markets#index"


  get "/log-out",            to: "sessions#destroy"


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
