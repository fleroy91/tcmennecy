module Refinery
  module ResSportifs
    module Admin
      class ResSportifsController < ::Refinery::AdminController

        crudify :'refinery/res_sportifs/res_sportif',
                :title_attribute => 'titre',
                :xhr_paging => true

      end
    end
  end
end
