module Refinery
  module ResSportifs
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::ResSportifs

      engine_name :refinery_res_sportifs

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "res_sportifs"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.res_sportifs_admin_res_sportifs_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/res_sportifs/res_sportif',
            :title => 'titre'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::ResSportifs)
      end
    end
  end
end
