Rails.application.routes.draw do
  root :to => 'login#index'

  # Routes for user authentication
  get 'login/login', :to => 'login#login'
  post 'login/do_login', :to => 'login#do_login'

  # Routes for admin authentication
  get  'login/admin_login', :to => 'login#admin_login'
  post 'login/do_admin_login', :to => 'login#do_admin_login'

  # Route for user's projects
  get 'proyectos/mis_proyectos', :to => 'proyectos#projects_for_user'
  post 'proyectos/remove_assignment', :to => 'proyectos#remove_user_from_wait_list'
  post 'proyectos/assign', :to => 'proyectos#add_user_to_wait_list'
  post 'proyectos/lista_espera', :to => 'proyectos#get_lista_espera_for_proyecto'
  post 'proyectos/asignar', :to => 'proyectos#approve_asignacion'

  get '/welcome/', :to => 'welcome#index'


  resources :welcome

  resources :dia_horas

  resources :horarios

  resources :proyecto_carreras

  resources :lista_espera_proyectos

  resources :admins

  resources :proyectos

  resources :ubicacions

  resources :carreras

  resources :usuarios

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
