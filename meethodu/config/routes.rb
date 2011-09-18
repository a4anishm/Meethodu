Meethodu::Application.routes.draw do

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "sessions#new"
  
  controller :sessions do
    get 'login' => :new
    post 'login' => :create

  end

  controller :profile do
    get 'profile' => :show
  end

  controller :friendship_sent_requests do
    post 'add_friend' => :create
    post 'friendship_sent_requests' => :create
    delete 'reject_friend' => :destroy
  end

  controller :logout do
    get 'logout' => :new
  end

  controller :projects do
    get 'my_projects' => :my_projects
  end

  controller :my_contributions do
    get 'my_contributions' => :get_my_contributions
  end
  resources :friendship_sent_requests

  controller :donor_requests do
    post '/donor_requests/accept' => :accept
    post '/donor_requests/reject' => :reject
    post '/donor_requests/yes_got_money' => :yes_got_money
    post '/donor_requests/no_money' => :no_money
  end
  resources :donor_requests

  resources :receiver_requests

  resources :project_fundings

  resources :projects


  resources :friendships

  resources :users

  resources :test_products

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
