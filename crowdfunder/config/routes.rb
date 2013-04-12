Crowdfunder::Application.routes.draw do

  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :projects, only: [:index, :show] do 
    resources :pledges
  end

  namespace :my do #my/projects/5     my/projects/2/edit    my/projects
    # goes to a my controller
    resources :projects do
      resources :images
    end
  end


  resources :users, except: [:index, :destroy]

  # Sign in and sign out actions
  resource :session, :only => [:new, :create, :destroy]

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end