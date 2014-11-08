module Refinery
  module Partenaires
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Partenaires

      engine_name :refinery_partenaires

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "partenaires"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.partenaires_admin_partenaires_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/partenaires/partenaire'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Partenaires)
      end
    end
  end
end
