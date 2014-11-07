Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}, :controllers => {:registrations => "registrations"}
  root 'static_pages#home'

  match '/about',     to: 'static_pages#about',     via: 'get'
  match '/tutorials', to: 'static_pages#tutorials', via: 'get'
  match '/faq',       to: 'static_pages#faq',       via: 'get'
  match '/balloon',   to: 'static_pages#balloon',   via: 'get'
  match '/learn-more',to: 'static_pages#learn-more',via: 'get'
  match '/contact',   to: 'static_pages#contact',   via: 'get'
  match '/registration/thanks', to: 'static_pages#thanks_register', via: 'get'
  match '/teams/:id/add_member/', to: 'teams#add_member', via: 'post', as: 'add_member'
  match '/teams/:id/remove_member/', to: 'teams#remove_member', via: 'delete', as: 'remove_member'
  match '/teams/feed' => 'teams#feed', :as => :feed, :defaults => {:format => 'atom'}, via: 'get'
  match '/teams/thanks', to: 'teams#thanks', via: 'get'
  resources :teams
  # use_doorkeeper

  namespace :api do

    namespace :v1 do
      get '/me' => 'credentials#me'
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
