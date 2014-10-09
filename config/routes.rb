Rails.application.routes.draw do

  get    "/vendors",                to: "vendors#index",         as: :vendors

  get    "/signup",                 to: "vendors#new"
  post   "/singup",                 to: "vendors#create"

  get    "/login",                  to: "sessions#index"
  post   "/login",                  to: "sessions#create"
  get    "/log-out",                to: "sessions#destroy"

  get    "/dashboard",              to: "vendors#show"
  get    "/edit",                   to: "vendors#edit"
  post   "/edit",                   to: "vendors#update"
  get    "/delete",                 to: "vendors#destroy"

  ## RESTful products
  get    "/products",               to: "products#index",        as: :products
  get    "/products/new",           to: "products#new",          as: :new_product
  post   "/products/new",           to: "products#create"
  get    "/products/:id",           to: "products#show",         as: :show_product
  get    "/products/:id/edit",      to: "products#edit",         as: :edit_product
  put    "/products/:id",           to: "products#update"
  get    "/products/:id/delete",    to: "products#destroy_prep", as: :delete_product
  delete "/products/:id",           to: "products#destroy"

  ## these aren't necessarily updated to be RESTful yet
  # get  "/product/:id/sale",       to: "sales#index"
  # post "/product/:id/sale",       to: "sales#create"

  get    "/add-market",             to: "markets#new" # change this to markets/new & add a check that redirects if not logged in
  post   "/add-market",             to: "markets#create" # ditto above
  get    "/edit-markets",           to: "markets#edit_prep" #change this to /markets/edit and above note
  post   "/edit-markets",           to: "markets#edit_post" # ditto above
  get    "/market/:id/edit",        to: "markets#edit"
  post   "/market/edit",            to: "markets#update" #update URL to be market/:id for POST
  get    "/market",                 to: "markets#index", as: :markets # make this and child urls plural

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
