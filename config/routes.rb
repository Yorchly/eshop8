Rails.application.routes.draw do


  root :to => 'catalog#index'

  get 'about' => 'about#index'
  get 'checkout' => 'checkout#index'
  get 'admin/developer' => 'admin/developer#index'
  get 'admin/supplier' => 'admin/supplier#index'
  get 'admin/program' => 'admin/program#index'
  get 'catalog' => 'catalog#index'
  get 'admin/order' => 'admin/order#index'

  get 'admin/developer/new'
  post 'admin/developer/create'
  get 'admin/developer/edit'
  post 'admin/developer/update'
  post 'admin/developer/destroy'
  get 'admin/developer/show'
  get 'admin/developer/show/:id' => 'admin/developer#show'
  get 'admin/developer/index'

  get 'admin/supplier/new'
  post 'admin/supplier/create'
  get 'admin/supplier/edit'
  post 'admin/supplier/update'
  post 'admin/supplier/destroy'
  get 'admin/supplier/show/:id' => 'admin/supplier#show'
  get 'admin/supplier/index'
  get 'admin/about/index'

  get 'admin/program/new'
  post 'admin/program/create'
  get 'admin/program/edit'
  post 'admin/program/update'
  post 'admin/program/destroy'
  get 'admin/program/show'
  get 'admin/program/show/:id' => 'admin/program#show'
  get 'admin/program/index'

  post 'admin/order/close'
  post 'admin/order/destroy'
  get 'admin/order/show'
  get 'admin/order/show/:id' => 'admin/order#show'
  get 'admin/order/index'

  get 'catalog/show'
  get 'catalog/show/:id' => 'catalog#show'
  get 'catalog/index'
  get 'catalog/latest'

  get 'cart/add'
  post 'cart/add'
  get 'cart/remove'
  post 'cart/remove'
  get 'cart/clear'
  post 'cart/clear'
	
  get 'checkout/index'
  post 'checkout/submit_order'
  get 'checkout/thank_you'

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
