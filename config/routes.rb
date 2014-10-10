Rails.application.routes.draw do

  get    "/search",                 to: "results#go_home"
  post   "/search",                 to: "results#search"#,           as: :search

  ## RESTful vendors (not 100% RESTful)
  get    "/vendors",                to: "vendors#index",         as: :vendors
  get    "/vendors/:id",            to: "vendors#show",          as: :show_vendor
  get    "/signup",                 to: "vendors#new",           as: :new_vendor
  post   "/signup",                 to: "vendors#create"
  get    "/dashboard",              to: "vendors#dashboard",     as: :dashboard
  get    "/edit",                   to: "vendors#edit",          as: :edit_vendor
  put    "/edit",                   to: "vendors#update"
  get    "/delete",                 to: "vendors#destroy_prep",  as: :delete_vendor
  delete "/delete",                 to: "vendors#destroy"

  ## RESTful sessions (nothing really changed here, not 100% RESTful)
  get    "/login",                  to: "sessions#index",        as: :login
  post   "/login",                  to: "sessions#create"
  get    "/log-out",                to: "sessions#destroy"

  ## RESTful products
  get    "/products",               to: "products#index",        as: :products
  get    "/products/new",           to: "products#new",          as: :new_product
  post   "/products/new",           to: "products#create"
  get    "/products/:id",           to: "products#show",         as: :show_product  #### NEED SOMETHING LIKE THIS FOR VENDORS?
  get    "/products/:id/edit",      to: "products#edit",         as: :edit_product
  put    "/products/:id",           to: "products#update"
  get    "/products/:id/delete",    to: "products#destroy_prep", as: :delete_product
  delete "/products/:id",           to: "products#destroy"

  ## these aren't necessarily updated to be RESTful yet
  # get  "/product/:id/sale",       to: "sales#index"
  # post "/product/:id/sale",       to: "sales#create"

  get "/sales/new",                  to: "sales#new",            as: :new_sale

  ## RESTful markets
  get    "/markets",                to: "markets#index",         as: :markets
  get    "/markets/new",            to: "markets#new",           as: :new_market
  post   "/markets/new",            to: "markets#create"
  get    "/markets/:id",            to: "markets#show",          as: :show_market
  get    "/edit-markets",           to: "markets#edit_prep",     as: :edit_markets_landing
  post   "/edit-markets",           to: "markets#edit_post"
  get    "/markets/:id/edit",       to: "markets#edit",          as: :edit_market
  put    "/markets/:id",            to: "markets#update"

  root   "home#index"

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
