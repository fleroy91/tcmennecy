Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :partenaires do
    resources :partenaires, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :partenaires, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :partenaires, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
