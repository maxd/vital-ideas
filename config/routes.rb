ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.

  # User routes 
  map.root :controller => "dashboard"
  map.dashboard "", :controller => "dashboard", :action => "index" 
  map.login "/login", :controller => "user_session", :action => "login"
  map.logout "/logout", :controller => "user_session", :action => "logout" 

  map.register "/register", :controller => "user_session", :action => "register" 
  map.profile "/profile", :controller => "user_session", :action => "profile"
  map.edit_profile "/profile/edit", :controller => "user_session", :action => "edit_profile"

  map.request_reset_password "/reset_password/request", :controller => "user_session", :action => "request_reset_password"
  map.reset_password "/reset_password/:id", :controller => "user_session", :action => "reset_password"

  map.welcome "/welcome", :controller => "dashboard", :action => "welcome"
  map.user_dashboard "/dashboard", :controller => "dashboard", :action => "dashboard"  
  map.show_public_idea "/public-idea/:id", :controller => "dashboard", :action => "show_public_idea"

  map.resources :ideas do |idea|
    idea.resources :features, :except => [ :index, :show ]
  end
  map.publish_idea "/ideas/publish/:id", :controller => "ideas", :action => "publish", :publish => true
  map.unpublish_idea "/ideas/unpublish/:id", :controller => "ideas", :action => "publish", :publish => false
  map.sticky_idea "/ideas/sticky/:id", :controller => "ideas", :action => "sticky", :sticky => true
  map.unsticky_idea "/ideas/unsticky/:id", :controller => "ideas", :action => "sticky", :sticky => false
  map.tagged_ideas "/ideas/tag/:tag", :controller => "ideas", :action => "tag"

  map.settings "/settings", :controller => "settings/tags", :action => "index"
  map.namespace :settings do |settings|
    settings.resources :tags, :except => [ :show, :new, :create ]
  end

  # Administration panel routes
  map.admin_dashboard "/admin", :controller => "admin/admin_dashboard", :action => "index"

  map.namespace :admin do |admin|
    admin.resources :users
  end

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
