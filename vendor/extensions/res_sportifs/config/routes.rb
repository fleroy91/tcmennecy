Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :res_sportifs do
    resources :res_sportifs, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :res_sportifs, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :res_sportifs, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
