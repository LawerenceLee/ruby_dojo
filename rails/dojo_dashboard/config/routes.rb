Rails.application.routes.draw do
  get    'dojos/:dojo_id/students/new',      to: "students#new", as: :student_new
  post   'dojos/:dojo_id/students',          to: "students#create", as: :student_create
  get    'dojos/:dojo_id/students/:id',      to: "students#show", as: :student_show
  get    'dojos/:dojo_id/students/:id/edit', to: "students#edit", as: :student_edit
  patch  'dojos/:dojo_id/students/:id',      to: "students#update", as: :student_update
  put    'dojos/:dojo_id/students/:id',      to: "students#update"
  delete 'dojos/:dojo_id/students/:id',      to: "students#destroy", as: :student_destroy

  get    'dojos',               to: "dojos#main", as: :main
  post   'dojos/create',        to: "dojos#create", as: :create
  get    'dojos/new',           to: "dojos#new", as: :new
  get    'dojos/:dojo_id',      to: "dojos#show", as: :show
  patch  'dojos/:dojo_id',      to: "dojos#update", as: :update
  put    'dojos/:dojo_id',      to: "dojos#update" 
  get    'dojos/:dojo_id/edit', to: "dojos#edit", as: :edit
  delete 'dojos/:dojo_id',      to: "dojos#destroy", as: :destroy

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
