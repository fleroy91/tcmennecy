Refinery::Core::Engine.routes.draw do

  # Admin routes
  namespace :galleries, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :galleries, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
