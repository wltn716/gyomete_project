Rails.application.routes.draw do
  devise_for :users
  root 'home#firstpage'
  get 'home/firstpage'
  post 'home/firstpage_result'
  get 'home/form_write'
  post 'home/form_action'
  get 'form_view/:form_id' => "home#form_view"
  get 'home/form_list'
  post 'home/form_reply'
  get 'home/form_result'
  get 'form_mail/:form_id' => "home#form_mail"
  post 'form_m_update/:form_id' => "home#form_m_update"
  get 'home/post_write'
  #post 'home/post_acion'
  post 'post_action' => "home#post_action"
  get 'home/post_view'
  get 'home/post_list'
  post 'home/post_list'
  get 'home/post_result'
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
