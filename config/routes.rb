Rails.application.routes.draw do
  get 'cover/report'

  devise_for :users
  #root 'home#firstpage'
  root 'cover#report'
  post 'liking/:form_id' => 'home#liking', as: 'liking'
  post 'home/form_scrap_action'
  get 'home/form_scrap'
  get 'home/firstpage'
  post 'home/firstpage_result'
  get 'home/form_write'
  post 'home/form_action'
  get 'form_view/:form_id' => "home#form_view"
  get 'form_destroy/:form_id' => "home#form_destroy"
  get 'form_reply_destroy/:reply_id' => "home#form_reply_destroy"  
  get 'form_update/:form_id' => "home#form_update"
  post 'form_update_action/:form_id' => "home#form_update_action"
  get 'form_list/:category' => "home#form_list", as: "category"
  post 'home/form_reply'
  get 'home/form_result'
  get 'form_mail/:form_id' => "home#form_mail"
  post 'form_m_update/:form_id' => "home#form_m_update"
  get 'home/post_write'
  #post 'home/post_acion'
  post 'post_action' => "home#post_action"
  get '/post_view/:post_id' => "home#post_view"
  get 'home/post_reply'
  post 'home/post_reply'
  #get 'home/post_view'
  get 'post_view/:post_id' => "home#post_view"
  get 'post_destroy/:post_id' => "home#post_destroy"
  get 'post_reply_destroy/:reply_id' => "home#post_reply_destroy"  
  get 'post_update/:post_id' => "home#post_update"
  post 'post_update_action/:post_id' => "home#post_update_action"
  get 'home/post_list'
  post 'home/post_list'
  get 'home/post_result'
  
  get 'users/myaccount'
  
  #get '/firstpage', to: 'home#firstpage'
  #get '/form_list', to: 'home#form_list'
  #get '/post_list', to: 'home#post_list'
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
